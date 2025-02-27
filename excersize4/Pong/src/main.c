#include "avalon_addr.h"
#include "main.h"

int avolon_read(unsigned int address) {
  volatile int *pointer = (volatile int *) address;
  return pointer[0];
}

void avolon_write(unsigned int address, int data) {
  volatile int *pointer = (volatile int *)  address;
  pointer[0] = data;
}

// our pixel format in memory is 5 bits of red, 6 bits of green, 5 bits of blue
#define PIXEL16(r,g,b) (((r & 0x1F)<<11) | ((g & 0x3F)<<5) | ((b & 0x1F)<<0))
// ... but for ease of programming we refer to colours in 8/8/8 format and discard the lower bits
#define PIXEL24(r,g,b) PIXEL16((r>>3), (g>>2), (b>>3))

#define PIXEL_WHITE PIXEL24(0xFF, 0xFF, 0xFF)
#define PIXEL_BLACK PIXEL24(0x00, 0x00, 0x00)
#define PIXEL_RED   PIXEL24(0xFF, 0x00, 0x00)
#define PIXEL_GREEN PIXEL24(0x00, 0xFF, 0x00)
#define PIXEL_BLUE  PIXEL24(0x00, 0x00, 0xFF)
#define DISPLAY_WIDTH	480
#define DISPLAY_HEIGHT	272

#define ball_size 5
#define bat_width 5
#define bat_height 50

int convertHex(int higher, int lower) {

  return higher * 16 + lower; 
  
}

int shiftTwice(int higher, int lower) {
  return higher * 256 + lower;
}

void hex_output(int value)
{
	int *hex_leds = (int *) 0x04000080;  // define a pointer to the register
	*hex_leds = value;                   // write the value to that address
}

int get_formatted_time(int time) {
  //dp(time);
  //time = div(time, 100);
  //dp(time);
  int cs = rem(time, 100);
  //dp(cs);
  int seconds = div(time, 100);
  int minutes = div(seconds, 60);
  seconds = rem(seconds, 60);

  minutes = convertHex(div(minutes, 10), rem(minutes, 10));
  seconds = convertHex(div(seconds, 10), rem(seconds, 10));
  cs = convertHex(div(cs, 10), rem(cs, 10));

  int final = shiftTwice(minutes, seconds);
  final = shiftTwice(final, cs);
  
  hex_output(final);
   
  return time;
}


void vid_set_pixel(int x, int y, int colour)
{
  // derive a pointer to the framebuffer described as 16 bit integers
  volatile short *framebuffer = (volatile short *) (FRAMEBUFFER_BASE);
  // make sure we don't go past the edge of the screen
  if ((x<0) || (x>DISPLAY_WIDTH-1))
    return;
  if ((y<0) || (y>DISPLAY_HEIGHT-1))
    return;

  framebuffer[x+y*DISPLAY_WIDTH] = colour;
}

/* void hex_output(int value) { */
/*   avolon_write(PIO_HEX_BASE, value); */

/* } */

void led_output(int value) {
  avolon_write(PIO_LED_BASE, value);
}

/*
Whenever there is a roll over we can note that as 
high -> low || low -> high
*/

int valChange(int prev, int new) {
  if (prev < new && new - prev > 100 ) { //Going down overflow
    return new - prev - 256;    
  } else if (prev > new && prev - new > 100) { //going up overflow
    return new - prev + 256;
  }else {
    return new - prev;
  }
}


void clear_screen() {

  volatile short *framebuffer = (volatile short *) (FRAMEBUFFER_BASE);
  
  for (int x=0; x < DISPLAY_WIDTH; x++) {
    for (int y=0; y < DISPLAY_HEIGHT; y++) {
      framebuffer[x + y * DISPLAY_WIDTH] = PIXEL_BLACK;
    }
  }
}

int reflect_off_wall(int dir) {
  return -dir;
}

int reflect_off_bat(int y) {
  int h = div(bat_height, 6);
  if (y<h) {
    return 4;
  } else if (y<(2*h)) {
    return 2;
  } else if (y<(2*h + h)) {
    return 1;
  } else if (y<(4*h)) {
    return -1;
  } else if (y<(4*h+h)) {
    return -2;
  } else {
    return -4;
  }
}

void update_bat(int cur, int new, int x) {
  for (int i = 0; i<bat_width; i++) {
    for (int j = 0; j<bat_height; j++) {
      vid_set_pixel(i+x, j+cur, PIXEL_BLACK);
      vid_set_pixel(i+x, j+new, PIXEL_WHITE);
    }
  }  
}

void update_ball(int curX, int curY, int newX, int newY) {
  for (int i = 0; i < ball_size; i++) {
    for (int j = 0; j < ball_size; j++) {
      vid_set_pixel(i+curX, j+curY, PIXEL_BLACK);
      vid_set_pixel(i+newX, j+newY, PIXEL_WHITE);
    }
  }
}

int main(void) {

  int true = 1, false = 0;

  int ballDirX = 1, ballDirY = 0;
  int ballPosX = DISPLAY_WIDTH >>1, ballPosY = DISPLAY_HEIGHT >> 1;
  int prevBallX = ballPosX, prevBallY = ballPosY;

  int bat1 = (DISPLAY_HEIGHT - bat_height) >> 1, bat2 = (DISPLAY_HEIGHT - bat_height) >> 1;
  int prevBat1 = bat1, prevBat2 = bat2;

  int leftChange, rightChange;
  int prevLeft = avolon_read(PIO_ROTARY_L),
    prevRight = avolon_read(PIO_ROTARY_R);

  int left, right;

  int maxH = DISPLAY_HEIGHT - bat_height;

  int leftMin = bat_width;
  int rightMax = DISPLAY_WIDTH - bat_width;

  //hits a wall
  //check which side and then if the bat is present
  //if it is side walls simple reflect
  
  
  while(true) {

    left = avolon_read(PIO_ROTARY_L);
    right = avolon_read(PIO_ROTARY_R);

    leftChange = valChange(prevLeft, left);
    rightChange = valChange(prevRight, right);

    prevLeft = left;
    prevRight = right;

    bat1 += 4*leftChange;
    bat2 += 4*rightChange;

    if (bat1 < 0) {
      bat1 = 1;
    } else if (bat1 > maxH) {
      bat1 = maxH-1;
    }

    if (bat2 < 0) {
      bat2 = 1;
    } else if (bat2 > maxH) {
      bat2 = maxH-1;
    }

    ballPosX += ballDirX<<1;
    ballPosY += ballDirY<<1;

    if (ballPosY <0) {
      ballPosY = 0;
      ballDirY = reflect_off_wall(ballDirY);
    } else if (ballPosY >=DISPLAY_HEIGHT) {
      ballPosY = DISPLAY_HEIGHT;
      ballDirY = reflect_off_wall(ballDirY);
    }

    if (ballPosX < leftMin) {//Hit the left wall
      ballPosX = leftMin;
      if (bat1 < ballPosY && ballPosY < bat1 + bat_height) {
	ballDirY = reflect_off_bat(ballPosY - bat1);
	ballDirX = -ballDirX;
      } else {
	ballPosX = DISPLAY_WIDTH >> 1;
	ballPosY = DISPLAY_HEIGHT >> 1;
	ballDirY = 0;
	ballDirX = 1;
      }
    } else if (ballPosX < rightMax) {//Hit the right wall
      ballPosX = rightMax;
      if (bat2 < ballPosY && ballPosY < bat2 + bat_height) {
	ballDirY = reflect_off_bat(ballPosY - bat1);
	ballDirX = -ballDirX;
      } else {
	ballPosX = DISPLAY_WIDTH >> 1;
	ballPosY = DISPLAY_HEIGHT >> 1;
	ballDirY = 0;
	ballDirX = -1;
      }
    }

    update_ball(prevBallX, prevBallY, ballPosX, ballPosY);
    update_bat(prevBat1, bat1, leftMin-bat_width);
    update_bat(prevBat2, bat2, rightMax);

    prevBallX = ballPosX;
    prevBallY = ballPosY;
    prevBat1 = bat1;
    prevBat2 = bat2;
    

  }

}

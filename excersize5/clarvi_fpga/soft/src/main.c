#include "main.h"
int myfunction(int x, int y)
{
	return x+y;
}

void dp(int value) {
  asm ("csrw    0x7B2, %0" :: "r" (value));
}

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
  
  //dp(minutes);
  //dp(seconds);
  //dp(cs);
  //dp(final);
  hex_output(final);
   
  return time;
}



int main(void)
{
	// declare some variables
	int x=12, y=34, z;

	//z = myfunction(x,y);
	//dp(z);
	while(1) { 
          z = div(get_time(), 100000);
	  //dp(z);
	  get_formatted_time(z);
	  //dp(-1);
         } 
	/* z = get_time(); */
	/* dp(z); */
	/* z = div(z, 16); */
	/* dp(z); */
	/* z = rem(z, 16); */
	/* dp(z); */
	/* dp(-1); */
	return z;
}

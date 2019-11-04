#include "main.h"
int myfunction(int x, int y)
{
	return x+y;
}

void dp(int value) {
  asm ("csrw    0x7B2, %0" :: "r" (value));
}

int get_formatted_time(int time) {
  /* dp(time+200); */
  /* time = div(time+1, 100); */
  /* dp(time); */
  /* int cs = rem(time+1, 100); */
  /* dp(cs); */
  /* int seconds = div(time, 100); */
  /* int minutes = div(seconds, 60); */
  /* seconds = rem(seconds, 60); */
  /* dp(seconds); */
  /* dp(minutes) */
  return time;
}



int main(void)
{
	// declare some variables
	int x=12, y=34, z;

	//z = myfunction(x,y);
	//dp(z);
	while(1) { 
          z = get_time();
	  dp(z); 
	  dp(div(z, 16)); 
	  dp(rem(z, 16));; 
	  dp(-1);
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

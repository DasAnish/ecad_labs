
module rotary_hex (
	clk_clk,
<<<<<<< HEAD
	reset_reset_n,
	rotary_in_left_rotary_in,
	rotary_event_left_rotary_cw,
	rotary_event_left_rotary_ccw,
	rotary_in_right_rotary_in,
	rotary_event_right_rotary_cw,
	rotary_event_right_rotary_ccw,
	buttons_export,
	shiftregctl_shiftreg_clk,
	shiftregctl_shiftreg_loadn,
	shiftregctl_shiftreg_out,
	led_pins_01_led0,
	led_pins_01_led1,
	led_pins_23_led0,
	led_pins_23_led1);	

	input		clk_clk;
	input		reset_reset_n;
	input	[1:0]	rotary_in_left_rotary_in;
	output		rotary_event_left_rotary_cw;
	output		rotary_event_left_rotary_ccw;
	input	[1:0]	rotary_in_right_rotary_in;
	output		rotary_event_right_rotary_cw;
	output		rotary_event_right_rotary_ccw;
	output	[15:0]	buttons_export;
	output		shiftregctl_shiftreg_clk;
	output		shiftregctl_shiftreg_loadn;
	input		shiftregctl_shiftreg_out;
	output	[6:0]	led_pins_01_led0;
	output	[6:0]	led_pins_01_led1;
	output	[6:0]	led_pins_23_led0;
	output	[6:0]	led_pins_23_led1;
=======
	eightbitstosevenseg_0_led_pins_led0,
	eightbitstosevenseg_0_led_pins_led1,
	reset_reset_n,
	rotaryctl_0_rotary_event_rotary_cw,
	rotaryctl_0_rotary_event_rotary_ccw,
	rotaryctl_0_rotary_in_rotary_in,
	eightbitstosevenseg_1_led_pins_led0,
	eightbitstosevenseg_1_led_pins_led1,
	rotaryctl_1_rotary_in_rotary_in,
	rotaryctl_1_rotary_event_rotary_cw,
	rotaryctl_1_rotary_event_rotary_ccw,
	shiftregctl_0_buttons_export,
	shiftregctl_0_shiftreg_ext_shiftreg_clk,
	shiftregctl_0_shiftreg_ext_shiftreg_loadn,
	shiftregctl_0_shiftreg_ext_shiftreg_out);	

	input		clk_clk;
	output	[6:0]	eightbitstosevenseg_0_led_pins_led0;
	output	[6:0]	eightbitstosevenseg_0_led_pins_led1;
	input		reset_reset_n;
	output		rotaryctl_0_rotary_event_rotary_cw;
	output		rotaryctl_0_rotary_event_rotary_ccw;
	input	[1:0]	rotaryctl_0_rotary_in_rotary_in;
	output	[6:0]	eightbitstosevenseg_1_led_pins_led0;
	output	[6:0]	eightbitstosevenseg_1_led_pins_led1;
	input	[1:0]	rotaryctl_1_rotary_in_rotary_in;
	output		rotaryctl_1_rotary_event_rotary_cw;
	output		rotaryctl_1_rotary_event_rotary_ccw;
	output	[15:0]	shiftregctl_0_buttons_export;
	output		shiftregctl_0_shiftreg_ext_shiftreg_clk;
	output		shiftregctl_0_shiftreg_ext_shiftreg_loadn;
	input		shiftregctl_0_shiftreg_ext_shiftreg_out;
>>>>>>> 5b25eb9d82842b08af39b30ab2671937ae786069
endmodule


module ex2b (
	clk_clk,
	reset_reset_n,
	rotary_in_1_rotary_in,
	rotary_in_2_rotary_in,
	led_pins_1_led0,
	led_pins_1_led1,
	led_pins_2_led0,
	led_pins_2_led1,
	buttons_export,
	shift_shiftreg_clk,
	shift_shiftreg_loadn,
	shift_shiftreg_out,
	rotary_event_1_rotary_cw,
	rotary_event_1_rotary_ccw,
	rotary_event_2_rotary_cw,
	rotary_event_2_rotary_ccw);	

	input		clk_clk;
	input		reset_reset_n;
	input	[1:0]	rotary_in_1_rotary_in;
	input	[1:0]	rotary_in_2_rotary_in;
	output	[6:0]	led_pins_1_led0;
	output	[6:0]	led_pins_1_led1;
	output	[6:0]	led_pins_2_led0;
	output	[6:0]	led_pins_2_led1;
	output	[15:0]	buttons_export;
	output		shift_shiftreg_clk;
	output		shift_shiftreg_loadn;
	input		shift_shiftreg_out;
	output		rotary_event_1_rotary_cw;
	output		rotary_event_1_rotary_ccw;
	output		rotary_event_2_rotary_cw;
	output		rotary_event_2_rotary_ccw;
endmodule

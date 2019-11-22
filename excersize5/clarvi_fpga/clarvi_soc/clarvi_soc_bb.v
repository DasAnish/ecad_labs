
module clarvi_soc (
	clk_clk,
	hex_digits_external_export,
	leds_external_connection_export,
	pixelstream_0_conduit_end_0_lcd_red,
	pixelstream_0_conduit_end_0_lcd_green,
	pixelstream_0_conduit_end_0_lcd_blue,
	pixelstream_0_conduit_end_0_lcd_hsync,
	pixelstream_0_conduit_end_0_lcd_vsync,
	pixelstream_0_conduit_end_0_lcd_de,
	pixelstream_0_conduit_end_0_lcd_dclk,
	pixelstream_0_conduit_end_0_lcd_dclk_en,
	reset_reset_n,
	right_rotary_in_rotary_in,
	right_rotary_event_rotary_cw,
	right_rotary_event_rotary_ccw,
	left_rotary_in_rotary_in,
	left_rotary_event_rotary_cw,
	left_rotary_event_rotary_ccw,
	shiftregctl_shiftreg_clk,
	shiftregctl_shiftreg_loadn,
	shiftregctl_shiftreg_out);	

	input		clk_clk;
	output	[23:0]	hex_digits_external_export;
	output	[9:0]	leds_external_connection_export;
	output	[7:0]	pixelstream_0_conduit_end_0_lcd_red;
	output	[7:0]	pixelstream_0_conduit_end_0_lcd_green;
	output	[7:0]	pixelstream_0_conduit_end_0_lcd_blue;
	output		pixelstream_0_conduit_end_0_lcd_hsync;
	output		pixelstream_0_conduit_end_0_lcd_vsync;
	output		pixelstream_0_conduit_end_0_lcd_de;
	output		pixelstream_0_conduit_end_0_lcd_dclk;
	output		pixelstream_0_conduit_end_0_lcd_dclk_en;
	input		reset_reset_n;
	input	[1:0]	right_rotary_in_rotary_in;
	output		right_rotary_event_rotary_cw;
	output		right_rotary_event_rotary_ccw;
	input	[1:0]	left_rotary_in_rotary_in;
	output		left_rotary_event_rotary_cw;
	output		left_rotary_event_rotary_ccw;
	output		shiftregctl_shiftreg_clk;
	output		shiftregctl_shiftreg_loadn;
	input		shiftregctl_shiftreg_out;
endmodule

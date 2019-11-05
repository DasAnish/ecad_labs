	ex2b u0 (
		.clk_clk                   (<connected-to-clk_clk>),                   //            clk.clk
		.reset_reset_n             (<connected-to-reset_reset_n>),             //          reset.reset_n
		.rotary_in_1_rotary_in     (<connected-to-rotary_in_1_rotary_in>),     //    rotary_in_1.rotary_in
		.rotary_in_2_rotary_in     (<connected-to-rotary_in_2_rotary_in>),     //    rotary_in_2.rotary_in
		.led_pins_1_led0           (<connected-to-led_pins_1_led0>),           //     led_pins_1.led0
		.led_pins_1_led1           (<connected-to-led_pins_1_led1>),           //               .led1
		.led_pins_2_led0           (<connected-to-led_pins_2_led0>),           //     led_pins_2.led0
		.led_pins_2_led1           (<connected-to-led_pins_2_led1>),           //               .led1
		.buttons_export            (<connected-to-buttons_export>),            //        buttons.export
		.shift_shiftreg_clk        (<connected-to-shift_shiftreg_clk>),        //          shift.shiftreg_clk
		.shift_shiftreg_loadn      (<connected-to-shift_shiftreg_loadn>),      //               .shiftreg_loadn
		.shift_shiftreg_out        (<connected-to-shift_shiftreg_out>),        //               .shiftreg_out
		.rotary_event_1_rotary_cw  (<connected-to-rotary_event_1_rotary_cw>),  // rotary_event_1.rotary_cw
		.rotary_event_1_rotary_ccw (<connected-to-rotary_event_1_rotary_ccw>), //               .rotary_ccw
		.rotary_event_2_rotary_cw  (<connected-to-rotary_event_2_rotary_cw>),  // rotary_event_2.rotary_cw
		.rotary_event_2_rotary_ccw (<connected-to-rotary_event_2_rotary_ccw>)  //               .rotary_ccw
	);


	clarvi_soc u0 (
		.clk_clk                                 (<connected-to-clk_clk>),                                 //                         clk.clk
		.hex_digits_external_export              (<connected-to-hex_digits_external_export>),              //         hex_digits_external.export
		.leds_external_connection_export         (<connected-to-leds_external_connection_export>),         //    leds_external_connection.export
		.pixelstream_0_conduit_end_0_lcd_red     (<connected-to-pixelstream_0_conduit_end_0_lcd_red>),     // pixelstream_0_conduit_end_0.lcd_red
		.pixelstream_0_conduit_end_0_lcd_green   (<connected-to-pixelstream_0_conduit_end_0_lcd_green>),   //                            .lcd_green
		.pixelstream_0_conduit_end_0_lcd_blue    (<connected-to-pixelstream_0_conduit_end_0_lcd_blue>),    //                            .lcd_blue
		.pixelstream_0_conduit_end_0_lcd_hsync   (<connected-to-pixelstream_0_conduit_end_0_lcd_hsync>),   //                            .lcd_hsync
		.pixelstream_0_conduit_end_0_lcd_vsync   (<connected-to-pixelstream_0_conduit_end_0_lcd_vsync>),   //                            .lcd_vsync
		.pixelstream_0_conduit_end_0_lcd_de      (<connected-to-pixelstream_0_conduit_end_0_lcd_de>),      //                            .lcd_de
		.pixelstream_0_conduit_end_0_lcd_dclk    (<connected-to-pixelstream_0_conduit_end_0_lcd_dclk>),    //                            .lcd_dclk
		.pixelstream_0_conduit_end_0_lcd_dclk_en (<connected-to-pixelstream_0_conduit_end_0_lcd_dclk_en>), //                            .lcd_dclk_en
		.reset_reset_n                           (<connected-to-reset_reset_n>),                           //                       reset.reset_n
		.right_rotary_in_rotary_in               (<connected-to-right_rotary_in_rotary_in>),               //             right_rotary_in.rotary_in
		.right_rotary_event_rotary_cw            (<connected-to-right_rotary_event_rotary_cw>),            //          right_rotary_event.rotary_cw
		.right_rotary_event_rotary_ccw           (<connected-to-right_rotary_event_rotary_ccw>),           //                            .rotary_ccw
		.left_rotary_in_rotary_in                (<connected-to-left_rotary_in_rotary_in>),                //              left_rotary_in.rotary_in
		.left_rotary_event_rotary_cw             (<connected-to-left_rotary_event_rotary_cw>),             //           left_rotary_event.rotary_cw
		.left_rotary_event_rotary_ccw            (<connected-to-left_rotary_event_rotary_ccw>),            //                            .rotary_ccw
		.shiftregctl_shiftreg_clk                (<connected-to-shiftregctl_shiftreg_clk>),                //                 shiftregctl.shiftreg_clk
		.shiftregctl_shiftreg_loadn              (<connected-to-shiftregctl_shiftreg_loadn>),              //                            .shiftreg_loadn
		.shiftregctl_shiftreg_out                (<connected-to-shiftregctl_shiftreg_out>)                 //                            .shiftreg_out
	);


// ex2b.v

// Generated using ACDS version 16.1 196

`timescale 1 ps / 1 ps
module ex2b (
		input  wire       clk_clk,                             //                            clk.clk
		output wire [6:0] eightbitstosevenseg_0_led_pins_led0, // eightbitstosevenseg_0_led_pins.led0
		output wire [6:0] eightbitstosevenseg_0_led_pins_led1, //                               .led1
		input  wire       reset_reset_n,                       //                          reset.reset_n
		output wire       rotaryctl_0_rotary_event_rotary_cw,  //       rotaryctl_0_rotary_event.rotary_cw
		output wire       rotaryctl_0_rotary_event_rotary_ccw, //                               .rotary_ccw
		input  wire [1:0] rotaryctl_0_rotary_in_rotary_in      //          rotaryctl_0_rotary_in.rotary_in
	);

	wire  [7:0] rotaryctl_0_rotary_pos_export;  // RotaryCtl_0:rotary_pos -> EightBitsToSevenSeg_0:hexval
	wire        rst_controller_reset_out_reset; // rst_controller:reset_out -> [EightBitsToSevenSeg_0:reset, RotaryCtl_0:rst]

	EightBitsToSevenSeg eightbitstosevenseg_0 (
		.hexval (rotaryctl_0_rotary_pos_export),       //  data_in.export
		.digit0 (eightbitstosevenseg_0_led_pins_led0), // led_pins.led0
		.digit1 (eightbitstosevenseg_0_led_pins_led1), //         .led1
		.reset  (rst_controller_reset_out_reset),      //    reset.reset
		.clock  (clk_clk)                              //    clock.clk
	);

	rotary rotaryctl_0 (
		.clk        (clk_clk),                             //        clock.clk
		.rst        (rst_controller_reset_out_reset),      //   reset_sink.reset
		.rotary_in  (rotaryctl_0_rotary_in_rotary_in),     //    rotary_in.rotary_in
		.rot_cw     (rotaryctl_0_rotary_event_rotary_cw),  // rotary_event.rotary_cw
		.rot_ccw    (rotaryctl_0_rotary_event_rotary_ccw), //             .rotary_ccw
		.rotary_pos (rotaryctl_0_rotary_pos_export)        //   rotary_pos.export
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule

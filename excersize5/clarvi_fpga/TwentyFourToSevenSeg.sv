module TwentyFourToSevenSeg(
  input        clock,
  input        reset,
  input [23:0] hexval,
  output [6:0] digit0,
  output [6:0] digit1,
  output [6:0] digit2,
  output [6:0] digit3,
  output [6:0] digit4,
  output [6:0] digit5
);

   EightBitsToSevenSeg(.clock(clock),
			 .reset(reset),
			 .hexval(hexval[7:0]),
			 .digit0(digit0),
			 .digit1(digit1)
			 );

   EightBitsToSevenSeg(.clock(clock),
		       .reset(reset),
		       .hexval(hexval[15:8]),
		       .digit0(digit2),
		       .digit1(digit3),
		       );

   EightBitsToSevenSeg(.clock(clock),
		       .reset(reset),
		       .hexval(hexval[23:16]),
		       .digit0(digit4),
		       .digit1(digit5)
		       );
endmodule

   

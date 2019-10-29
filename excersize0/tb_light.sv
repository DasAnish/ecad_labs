`timescale 1ns / 1ps

module tb_tlight(
	output r,
	output a,
	output g);

	logic clk;

	tlight dut(.clk(clk), .r(r), .a(a), .g(g));

	initial begin
	clk = 0;
	end

	always #5
	clk <= !clk;

	always @(negedge clk)
		$display("time=%05d: (r, a, g) = (%1d, %1d, %1d)", 
		$time,
		r, a, g);

endmodule
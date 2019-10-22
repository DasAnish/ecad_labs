module tlight(
	input logic clk, 
	output logic r,
	output logic a, 
	output logic g);

	logic [2:0] state = 3'b000;

	always_ff @(posedge clk) begin

		state[2] <= state[2] ^ state[1];
		state[1] <= !state[1];
		state[0] <= state[1] && state[2];

	end

	assign g = state[0];
	assign a = state[1];
	assign r = state[2];

endmodule
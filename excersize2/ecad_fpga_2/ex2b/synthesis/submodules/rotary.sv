// rotary decoder template

module rotary
  (
	input  wire clk,
	input  wire rst,
	input  wire [1:0] rotary_in,
	output logic [7:0] rotary_pos,
        output logic rot_cw,
        output logic rot_ccw
   );

	//Adding wire definitions
	wire[1:0] rotary_out;
	
	logic[1:0] prev_values = 2'b00;

	//Initiating debounce inputs
	debounce dosync(.clk(clk), .rst(rst), .bouncy_in(rotary_in[1]), .clean_out(rotary_out[1]));
	debounce dosyn(.clk(clk), .rst(rst), .bouncy_in(rotary_in[0]), .clean_out(rotary_out[0]));
	
	//Synchronous output value manipulation logic
	always_ff @(posedge clk) 
	begin
		
		prev_values <= rotary_out;
		
		if (rst) 
		begin
			rotary_pos <= 0;
			rot_cw <= 0;
			rot_ccw <= 0;
		end
		else 
		begin
			if (prev_values==2'b00 && rotary_out == 2'b01) //clockwise edge
			begin
				rot_cw <= 1;
				rot_ccw <= 0;
				rotary_pos <= rotary_pos + 1;
			end
			else if (prev_values==2'b00 && rotary_out == 2'b10) //counter clockwise
			begin
				rot_cw <= 0;
				rot_ccw <= 1;
				rotary_pos <= rotary_pos - 1;
			end
			else if (prev_values==2'b10 && rotary_out==2'b00) // clockwise neg edge
			begin
				rot_cw<=0;
			end
			else if (prev_values==2'b01 && rotary_out==2'b00) // counter clockwise neg
			begin
				rot_ccw <= 0;
			end
		end
	end
	
endmodule // rotarydecoder

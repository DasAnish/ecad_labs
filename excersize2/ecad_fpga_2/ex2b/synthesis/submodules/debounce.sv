// debounce template

module debounce
  (
	input wire       clk,       // 50MHz clock input
	input wire       rst,       // reset input (positive)
	input wire       bouncy_in, // bouncy asynchronous input
	output reg 		 clean_out  // clean debounced output
   );

	//Wire definitions
	reg prev_sync;
	reg metastable;
	logic sync;
	logic[13:0] counter;
	wire counterComplete = &counter;

	//debouncing logic
	always_ff @(posedge clk) 
	begin
	
		//creating a stable output
		metastable <= bouncy_in;
		sync <= metastable;
	end
	
	always_ff @(posedge clk) 
	begin
		
		if (rst) 
		begin
			counter <= 0;
			prev_sync <= 0;
			clean_out <= 0;
		end else 
		begin
			prev_sync <= sync;
			if (sync != prev_sync) 
			begin
				counter <= 0;
			end else if (!counterComplete) 
				counter <= counter + 1;
			else 
				clean_out <= sync;
		end
	end
   
endmodule // debounce

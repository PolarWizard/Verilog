module STACK_structure #(
	parameter data_width = 8, 
	parameter STACK_depth = 8
	) 
	(
	input clk,
	input push,
	input pop,
	input peak,
	input [data_width-1:0] dataIn,
	output reg[data_width-1:0] dataOut
	);

	integer current_location = 0;
	
	reg [data_width-1:0] STACK_struct[STACK_depth-1:0];
	
	always @(posedge clk)
	begin
		if(push == 1 && pop == 0 && peak == 0) 
		begin
			if(current_location != STACK_depth)
			begin
				STACK_struct[current_location] <= dataIn; 
				current_location = current_location + 1;
			end
		end
		if(push == 0 && pop == 1 && peak == 0)
		begin
			if(current_location != 0)
			begin
				current_location = current_location - 1;
				dataOut <= STACK_struct[current_location];
			end
		end
		if(push == 0 && pop == 0 && peak == 1)
		begin
			if(current_location != 0)
			begin
				current_location = current_location - 1;
				dataOut <= STACK_struct[current_location];
				current_location = current_location + 1;
			end
		end
	end
endmodule	

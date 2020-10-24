module FIFO_structure #(
	parameter data_width = 8; 
	parameter FIFO_depth = 8
	) 
	(
	input clk,
	input read_enable,
	input write_enable,
	input [data_width-1:0] dataIn,
	output reg[data_width-1:0] dataOut
	); 
	
	integer locations_used = 0;
	integer read_location_ptr = 0;
	integer write_location_ptr = 0;
	
	reg [data_width-1:0] FIFO_struct[FIFO_depth-1:0];
	
	always @(posedge clk)
	begin
		if(read_enable == 1 && write_enable == 0) 
		begin
			if(locations_used != 0) 
			begin
				dataOut <= FIFO_struct[read_location_ptr];
				locations_used = locations_used - 1;
				read_location_ptr = read_location_ptr + 1;
				if(read_location_ptr == FIFO_depth)
				begin
					read_location_ptr = 0;
				end
			end
		end
		if(read_enable == 0 && write_enable == 1)
		begin
			if(locations_used != FIFO_depth)
			begin
				FIFO_struct[write_location_ptr] <= dataIn;
				locations_used = locations_used + 1;
				write_location_ptr = write_location_ptr + 1;
				if(write_location_ptr == FIFO_depth) 
				begin
					write_location_ptr = 0;
				end
			end 
		end		
	end
				
endmodule	

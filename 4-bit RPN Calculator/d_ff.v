module d_ff #(
	parameter data_width = 8
	)
	(
	input clk,
	input [data_width-1:0] d,
	output reg[data_width-1:0] q
	);
	
	always @(posedge clk)
	begin
		q <= d;
	end
	
endmodule

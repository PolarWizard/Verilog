module mux_2x1 #(
	parameter data_width = 8
	)
	(
	input [data_width-1:0] a,
	input [data_width-1:0] b,
	input sel,
	output reg [data_width-1:0] q
	);
	
	always @(a or b or sel)
	begin
		if (sel == 0) begin
			q <= a;
		end else begin
			q <= b;
		end
	end
	
endmodule

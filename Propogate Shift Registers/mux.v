module mux (
	input a,
	input b,
	input sel,
	output reg q
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

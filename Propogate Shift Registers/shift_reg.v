module shift_reg (
	input clk,
	input a,
	input b,
	input shift_lr,
	output reg q
	);
	
	wire mux_to_dff;
	wire out;
	
	d_ff d1(.clk(clk), .d(mux_to_dff), .q(out));
	mux m1(.a(a), .b(b), .sel(shift_lr), .q(mux_to_dff));
	
	always @(*) begin
		q = out;
	end
	
endmodule 	

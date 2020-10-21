module shift_mod #(
	parameter data_width = 8
	)
	(
	input clk,
	input left_in,
	input right_in,
	input shift_lr,
	output reg [data_width-1:0] q
	);

	genvar i;
	wire [data_width-1:0] out;
	
	generate 
		for (i = 0; i < data_width; i = i + 1) begin : gen_block
			if (i == 0) begin
				shift_reg sr1(.clk(clk), .a(left_in), .b(out[i+1]), .shift_lr(shift_lr), .q(out[i]));
			end
			else if ((i > 0) & (i < data_width - 1)) begin
				shift_reg sr2(.clk(clk), .a(out[i-1]), .b(out[i+1]), .shift_lr(shift_lr), .q(out[i]));
			end
			else if (i == data_width - 1) begin
				shift_reg sr3(.clk(clk), .a(out[i-1]), .b(right_in), .shift_lr(shift_lr), .q(out[i]));
			end
		end
	endgenerate

	always @(*) begin
		q = out;
	end
	
endmodule

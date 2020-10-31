module ALU #(
	parameter data_width = 4
	)
	(
	input [data_width-1:0] a,
	input [data_width-1:0] b,
	input [1:0] opcode,
	output reg [data_width-1:0] result
	);
	
	always @(*)
	begin
		case (opcode)
			2'b00: 
				result = a + b;
			2'b01: 
				result = a - b;
			2'b10: 
				result = a * b;
			default: 
				result = a;
		endcase
	end

endmodule
	
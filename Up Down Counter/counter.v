module counter (
	clk,
	reset,
	load,
	up_down,
	jump,
	q
	);
	
	input wire clk, reset, load, up_down;
	input wire [3:0] jump;
	output reg [3:0] q;
	
	always @(posedge clk)
	begin: counter
		if (reset == 1) begin
			q <= 4'b0000;
		end else if (enable == 1) begin
			if (load == 1) begin
				q <= jump;
			end else if (up_down == 1) begin
				q <= q + 1;
			end else if (up_down == 0) begin
				q <= q - 1;
			end 
		end
	end
		
endmodule

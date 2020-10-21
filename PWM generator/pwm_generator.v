module pwm_generator(
	input clk,
	input [7:0] duty_cycle,
	output reg q
	);
	
	reg [7:0] cnt;
	
	always @(posedge clk)
	begin
		cnt <= cnt + 1;
		q <= (cnt < duty_cycle);
	end
	
endmodule

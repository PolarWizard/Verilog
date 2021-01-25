module control_unit (
	input clk,
	input [4:0] ROM_addr,
	output reg [7:0] DataOut
	);
	
	reg [7:0] FSM_ROM[0:31];
	
	initial
	begin
		$readmemb("FSM_ROM.txt", FSM_ROM);
	end
	
	always @(posedge clk)
	begin
		DataOut <= FSM_ROM[ROM_addr];
	end
	
endmodule 
module RPN_Calculator #(
	parameter data_width = 4
	)
	(
	input clk,
	input [1:0] ALU_opcode,
	input push,
	input func,
	input [data_width-1:0] dataIn,
	output reg [data_width-1:0] dataOut,
	output reg [7:0] CU_signals_out,
	output reg [3:0] stack_out,
	output reg [3:0] reg1_out,
	output reg [3:0] alu_out,
	output reg [3:0] mux_out,
	output [data_width-1:0] s0,
	output [data_width-1:0] s1,
	output [data_width-1:0] s2,
	output [data_width-1:0] s3
	);
	
	wire [7:0] CU_dataOut; //7=reg1, 6=reg2, 5=push, 4=pop, 3=sel, 2-0=next state
	wire [data_width-1:0] STACK_dataOut;
	wire [data_width-1:0] REG1_dataOut;
	wire [data_width-1:0] REG2_dataOut;
	wire [data_width-1:0] ALU_dataOut;
	wire [data_width-1:0] MUX_dataOut;
	
	control_unit CU(
		.clk(clk),
		.ROM_addr({func, push, CU_dataOut[2:0]}),
		.DataOut(CU_dataOut)
		);
	
	STACK_structure #(
		.data_width(data_width),
		.STACK_depth(32)
		)
		stack(
		.clk(clk),
		.push(CU_dataOut[5]),
		.pop(CU_dataOut[4]),
		.peak(0),
		.dataIn(MUX_dataOut),
		.dataOut(STACK_dataOut),
		.q0(s0),
		.q1(s1),
		.q2(s2),
		.q3(s3)
		);
		
	d_ff #(
		.data_width(data_width)
		)
		reg1(
		.clk(CU_dataOut[7]),
		.d(STACK_dataOut),
		.q(REG1_dataOut)
		);
		
	ALU #(
		.data_width(data_width)
		)
		ALU1(
		.a(REG1_dataOut),
		.b(STACK_dataOut),
		.opcode(ALU_opcode),
		.result(ALU_dataOut)
		);
		
	d_ff #(
		.data_width(data_width)
		)
		reg2(
		.clk(CU_dataOut[6]),
		.d(ALU_dataOut),
		.q(REG2_dataOut)
		);
		
	mux_2x1 #(
		.data_width(data_width)
		)
		mux(
		.a(dataIn),
		.b(REG2_dataOut),
		.sel(CU_dataOut[3]),
		.q(MUX_dataOut)
		);
		
		always @(*) begin
			dataOut = REG2_dataOut;
			CU_signals_out = CU_dataOut;
			stack_out = STACK_dataOut;
			reg1_out = REG1_dataOut;
			alu_out = ALU_dataOut;
			mux_out = MUX_dataOut;
		end
		
endmodule		


module alu(
	input signed [31:0] alu_a,
	input signed [31:0] alu_b,	
	input [4:0] alu_op,	
	output reg[31:0] alu_out
    );
	 `include "para_def.v"
always @(*)
		case(alu_op)
			A_NOP: alu_out=alu_out;
			A_ADD: alu_out=alu_a+alu_b;
			A_SUB: alu_out=alu_a-alu_b;
			A_AND: alu_out=alu_a&alu_b;
			A_OR:  alu_out=alu_a|alu_b;
			A_XOR: alu_out=alu_a^alu_b;
			A_NOR: alu_out=~(alu_a|alu_b);
			A_SLL: alu_out=alu_b<<alu_a[4:0];
			A_SRL: alu_out=alu_b>>alu_a[4:0];
			A_LUI: alu_out={alu_b,16'b0};
			A_COM: alu_out=($signed(alu_a)<$signed(alu_b))?1:0;
			A_COMU: alu_out=($unsigned(alu_a)<$unsigned(alu_b))?1:0;
			A_MULT: alu_out=alu_a*alu_b;
			default: alu_out=alu_out;
		endcase
endmodule

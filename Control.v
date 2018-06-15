module Control(
	input [5:0]Op,
	input [5:0]Funct,
	input [4:0]Rt,						//用于分辨bgez和bltz
	output reg RegDst,				//0时以[20:16](rt)为目标寄存器，1时以[15:11](rd)为目标寄存器
	output reg RegWrite,
	output reg ALUSrcB,				//0时为寄存器值，1时为立即数
	output reg ALUSrcA,				//0时选择寄存器值，1时选择Shamt段
	output reg MemRead,
	output reg MemWrite,
	output reg MemtoReg,				//1时选择从存储器读出的数据，0时选择ALU的结果
	output reg Branch,
	output reg [2:0]BranchOp,		//分几种不同的跳转指令:0->beq,1->bgez,2->bgtz,3->blez,4->bltz,5->bne
	output reg [4:0]ALUControl,
	output reg Jump,
	output reg Jumpr,
	output reg [3:0]LoadType,//lw,lb,lbu,lh,lhu,lwl,lwr
	output reg [2:0]SaveType//sw,sb,sh,swl,swr
    );
 `include "para_def.v"
always@(*)
	begin
		RegDst=0;
		RegWrite=0;
		ALUSrcB=0;
		ALUSrcA=0;
		MemRead=0;
		MemWrite=0;
		MemtoReg=0;
		Branch=0;
		ALUControl=0;
		Jump=0;
		Jumpr=0;
		BranchOp=0;
		LoadType=0;
		SaveType=0;
		case(Op)
			OP_RTYPE: begin
				RegWrite=1;
				RegDst=1;//[15:11]作为目标寄存器地址
				case(Funct)
					FUNCT_ADD: ALUControl=A_ADD;
					FUNCT_ADDU: ALUControl=A_ADD;
					FUNCT_SUB: ALUControl=A_SUB;
					FUNCT_SUBU: ALUControl=A_SUB;
					FUNCT_MULT: ALUControl=A_MULT;
					FUNCT_MULTU: ALUControl=A_MULT;
					FUNCT_AND: ALUControl=A_AND;
					FUNCT_OR: ALUControl=A_OR;
					FUNCT_XOR: ALUControl=A_XOR;
					FUNCT_NOR: ALUControl=A_NOR;
					FUNCT_SRL: begin
						ALUControl=A_SRL;
						ALUSrcA=1;
					end
					FUNCT_SRLV: ALUControl=A_SRL;
					FUNCT_SLL: begin 
						ALUControl=A_SLL;
						ALUSrcA=1;
					end
					FUNCT_SLLV: ALUControl=A_SLL;
					FUNCT_JR: begin
						Jump=1;
						Jumpr=1;
						Branch=1;
						RegWrite=0;
					end
					FUNCT_SLT: ALUControl=A_COM;
					FUNCT_SLTU: ALUControl=A_COMU;
					default: ALUControl=A_NOP;
				endcase
			end
			OP_ADDI: begin
				RegWrite=1;
				ALUSrcB=1;
				ALUControl=A_ADD;
			end
			OP_ADDIU: begin
				RegWrite=1;
				ALUSrcB=1;
				ALUControl=A_ADD;
			end
			OP_ANDI: begin
				RegWrite=1;
				ALUSrcB=1;
				ALUControl=A_AND;
			end
			OP_XORI: begin
				RegWrite=1;
				ALUSrcB=1;
				ALUControl=A_XOR;
			end
			OP_BEQ: begin
				Branch=1;
				BranchOp=4'd0;
			end
			6'h1: begin
				Branch=1;
				case(Rt)
					5'h1:BranchOp=4'd1;//bgez
					5'h0:BranchOp=4'd4;//bltz
				endcase
			end
			OP_BGTZ: begin
				Branch=1;
				BranchOp=4'd2;
			end
			OP_BLEZ: begin
				Branch=1;
				BranchOp=4'd3;
			end
			/*OP_BLTZ: begin
				Branch=1;
				BranchOp=4'd4;
			end*/
			OP_BNE: begin
				Branch=1;
				BranchOp=4'd5;
			end
			OP_J:begin
				Jump=1;
			end
			OP_LW: begin
				ALUSrcB=1;
				MemRead=1;
				RegWrite=1;
				MemtoReg=1;
				ALUControl=A_ADD;
				LoadType=Type_LW;
			end 
			OP_LB: begin
				ALUSrcB=1;
				MemRead=1;
				RegWrite=1;
				MemtoReg=1;
				ALUControl=A_ADD;
				LoadType=Type_LB;
			end
			OP_LBU: begin
				ALUSrcB=1;
				MemRead=1;
				RegWrite=1;
				MemtoReg=1;
				ALUControl=A_ADD;
				LoadType=Type_LBU;
			end
			OP_LH: begin
				ALUSrcB=1;
				MemRead=1;
				RegWrite=1;
				MemtoReg=1;
				ALUControl=A_ADD;
				LoadType=Type_LH;
			end
			OP_LHU: begin
				ALUSrcB=1;
				MemRead=1;
				RegWrite=1;
				MemtoReg=1;
				ALUControl=A_ADD;
				LoadType=Type_LHU;
			end
			OP_LWL: begin
				ALUSrcB=1;
				MemRead=1;
				RegWrite=1;
				MemtoReg=1;
				ALUControl=A_ADD;
				LoadType=Type_LWL;
			end
			OP_LWR: begin
				ALUSrcB=1;
				MemRead=1;
				RegWrite=1;
				MemtoReg=1;
				ALUControl=A_ADD;
				LoadType=Type_LWR;
			end
			OP_SW: begin
				ALUSrcB=1;
				MemWrite=1;
				ALUControl=A_ADD;
				SaveType=Type_SW;
			end
			OP_SB: begin
				ALUSrcB=1;
				MemWrite=1;
				ALUControl=A_ADD;
				SaveType=Type_SB;
			end
			OP_SH: begin
				ALUSrcB=1;
				MemWrite=1;
				ALUControl=A_ADD;
				SaveType=Type_SH;
			end
			OP_SWL: begin
				ALUSrcB=1;
				MemWrite=1;
				ALUControl=A_ADD;
				SaveType=Type_SWL;
			end
			OP_SWR: begin
				ALUSrcB=1;
				MemWrite=1;
				ALUControl=A_ADD;
				SaveType=Type_SWR;
			end
			OP_SLTI: begin
				ALUSrcB=1;
				RegWrite=1;
				ALUControl=A_COM;
			end
			OP_SLTIU: begin
				ALUSrcB=1;
				RegWrite=1;
				ALUControl=A_COMU;
			end
			
		endcase
	end

endmodule

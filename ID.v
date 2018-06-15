module ID(
	input clk,
	input rst_n,
	input [31:0]IF_ID_Ins,
	input [31:0]IF_ID_PC_P1,
	input WB_RegWrite,
	input [31:0]WB_WriteD,
	input [4:0]WB_WriteA,
	input ID_ForwardA,		
	input ID_ForwardB,//转发信号
	input [31:0]WB_Data,//转发的数据
	output [31:0]ID_RD1,
	output [31:0]ID_RD2,
	output [4:0]ID_Rs,
	output [4:0]ID_Rt,
	output [4:0]ID_Rd,
	output [4:0]ID_Shamt,
	output [31:0]ID_SignImm,
	output ID_RegDst,
	output ID_RegWrite,
	output ID_ALUSrcB,
	output ID_ALUSrcA,
	output ID_MemRead,
	output ID_MemWrite,
	output ID_MemtoReg,
	output ID_Branch,
	output [2:0]ID_BranchOp,
	output [4:0]ID_ALUControl,
	output ID_Jump,
	output ID_Jumpr,
	output [31:0]ID_PCBranch,
	output ID_PCSrc,
	output [3:0]ID_LoadType,
	output [2:0]ID_SaveType
	//output reg ID_Stall
    );
wire [5:0]Op;
wire [5:0]Funct;
wire [15:0]Imm;
wire signed [31:0]RD1;
wire signed [31:0]RD2;
reg [31:0]ID_PCBranchJ;
reg [31:0]ID_PCBranchB;

assign Op=IF_ID_Ins[31:26];
assign Funct=IF_ID_Ins[5:0];
assign Imm=IF_ID_Ins[15:0];
assign ID_Rs=IF_ID_Ins[25:21];
assign ID_Rt=IF_ID_Ins[20:16];
assign ID_Rd=IF_ID_Ins[15:11];
assign ID_Shamt=IF_ID_Ins[10:6];
assign ID_RD1=ID_ForwardA?WB_Data:RD1;
assign ID_RD2=ID_ForwardB?WB_Data:RD2;//冲突处理待完成

REG_FILE register (
    .clk(clk), 
    .rst_n(rst_n), 
    .rAddr1(ID_Rs), 
    .rAddr2(ID_Rt), 
    .rDout1(RD1), 
    .rDout2(RD2), 
    .wAddr(WB_WriteA), 
    .wDin(WB_WriteD), 
    .wEna(WB_RegWrite)
    );

Sign_Extend extend (
    .in(Imm), 
    .out(ID_SignImm)
    );
	 
Control ctrlunit (
    .Op(Op), 
    .Funct(Funct), 
    .Rt(ID_Rt), 
    .RegDst(ID_RegDst), 
    .RegWrite(ID_RegWrite), 
    .ALUSrcB(ID_ALUSrcB), 
	 .ALUSrcA(ID_ALUSrcA),
    .MemRead(ID_MemRead), 
    .MemWrite(ID_MemWrite), 
    .MemtoReg(ID_MemtoReg), 
    .Branch(ID_Branch), 
    .BranchOp(ID_BranchOp), 
    .ALUControl(ID_ALUControl), 
    .Jump(ID_Jump), 
    .Jumpr(ID_Jumpr),
	 .LoadType(ID_LoadType),
	 .SaveType(ID_SaveType)
    );
	 
always@(*)							//产生j和jr的目标地址
	if(ID_Jump)
		if(ID_Jumpr)
			ID_PCBranchJ=ID_RD1;
		else
			ID_PCBranchJ={IF_ID_PC_P1[31:28],2'b00,IF_ID_Ins[25:0]};
	else 
		ID_PCBranchJ=IF_ID_PC_P1;
	
reg Branch;	
always@(*)							//根据不同分支类型进行不同的判断
	case(ID_BranchOp)
		4'd0: Branch=(ID_RD1==ID_RD2);//beq
		4'd1: Branch=($signed(ID_RD1)>=0);//bgez
		4'd2: Branch=($signed(ID_RD1)>0); //bgtz
		4'd3: Branch=($signed(ID_RD1)<=0);//blez
		4'd4: Branch=($signed(ID_RD1)<0); //bltz
		4'd5: Branch=(ID_RD1!=ID_RD2);//bne
		default: Branch=0;
	endcase

always@(Branch)					//产生分支指令地址
	if(Branch)
		ID_PCBranchB=ID_SignImm+IF_ID_PC_P1;
	else
		ID_PCBranchB=IF_ID_PC_P1;
assign ID_PCBranch=ID_Jump?ID_PCBranchJ:ID_PCBranchB;	
assign ID_PCSrc=(ID_Branch&Branch)|ID_Jump;//分支满足条件或者是j,jr指令时进行跳转
//assign ID_Stall=(Branch|ID_Jump)?1:0;//预测分支发生，只要有跳转指令，立刻停止流水线
endmodule

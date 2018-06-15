
module top(
	input clk,
	input rst_n,
	input [6:0]Addr,
	input SelectMode,
	output [7:0]data,
	output [3:0]sel
    );
wire [31:0]nPC_P1;
wire [31:0]nPC_BJ;
wire ID_PCSrc;
wire [31:0]PC_P1;
wire [31:0]Ins;
wire [31:0]IF_ID_Ins;
wire [31:0]IF_ID_PC_P1;
wire [31:0]ID_PCBranch;
wire Stall_IF;
wire Stall_ID;
wire Flush_EX;
IF _IF (
    .clk(clk), 
    .rst_n(rst_n), 
    .nPC_P1(nPC_P1), 
    .nPC_BJ(ID_PCBranch), 
    .PCSrc(ID_PCSrc),
	 .Stall_IF(Stall_IF),
    .PC_P1(PC_P1), 
    .Ins(Ins)
    );
IF_ID _IF_ID (
    .clk(clk), 
    .rst_n(rst_n), 
    .Ins(Ins), 
    .PC_P1(PC_P1),
	 .Stall_ID(Stall_ID),
	 .ID_PCSrc(ID_PCSrc),
    .IF_ID_Ins(IF_ID_Ins), 
    .IF_ID_PC_P1(IF_ID_PC_P1)
    );
wire MEM_WB_RegWrite;
wire [31:0]WB_Data; 
wire [4:0]WB_RegWriteA;
wire WB_RegWrite;
wire [31:0]ID_RD1;
wire [31:0]ID_RD2;
wire [4:0]ID_Rs;
wire [4:0]ID_Rt;
wire [4:0]ID_Rd;
wire [4:0]ID_Shamt;
wire [31:0]ID_SignImm;
wire ID_RegDst;
wire ID_RegWrite;
wire ID_ALUSrcB;
wire ID_ALUSrcA;
wire ID_MemRead;
wire ID_MemWrite;
wire ID_MemtoReg;
wire ID_Branch;
wire [2:0]ID_BranchOp;
wire [4:0]ID_ALUControl;
wire ID_Jump;
wire ID_Jumpr;
wire [3:0]ID_LoadType;
wire [2:0]ID_SaveType;
wire ID_ForwardA;
wire ID_ForwardB;
ID _ID (
    .clk(clk), 
    .rst_n(rst_n), 
    .IF_ID_Ins(IF_ID_Ins), 
    .IF_ID_PC_P1(IF_ID_PC_P1), 
    .WB_RegWrite(WB_RegWrite), 
    .WB_WriteD(WB_Data), 
    .WB_WriteA(WB_RegWriteA), 
	 .ID_ForwardA(ID_ForwardA), 
    .ID_ForwardB(ID_ForwardB),
	 .WB_Data(WB_Data),
    .ID_RD1(ID_RD1),
    .ID_RD2(ID_RD2), 
    .ID_Rs(ID_Rs), 
    .ID_Rt(ID_Rt), 
    .ID_Rd(ID_Rd), 
	 .ID_Shamt(ID_Shamt),
    .ID_SignImm(ID_SignImm), 
    .ID_RegDst(ID_RegDst), 
    .ID_RegWrite(ID_RegWrite), 
    .ID_ALUSrcB(ID_ALUSrcB), 
	 .ID_ALUSrcA(ID_ALUSrcA),
    .ID_MemRead(ID_MemRead), 
    .ID_MemWrite(ID_MemWrite), 
    .ID_MemtoReg(ID_MemtoReg), 
    .ID_Branch(ID_Branch), 
    .ID_BranchOp(ID_BranchOp), 
    .ID_ALUControl(ID_ALUControl), 
    .ID_Jump(ID_Jump), 
    .ID_Jumpr(ID_Jumpr), 
    .ID_PCBranch(ID_PCBranch), 
    .ID_PCSrc(ID_PCSrc),
	 .ID_LoadType(ID_LoadType),
	 .ID_SaveType(ID_SaveType)
    );
wire [31:0]ID_EX_RD1;
wire [31:0]ID_EX_RD2;
wire [4:0]ID_EX_Rs;
wire [4:0]ID_EX_Rt;
wire [4:0]ID_EX_Rd;
wire [4:0]ID_EX_Shamt;
wire [31:0]ID_EX_SignImm;
wire ID_EX_RegDst;
wire ID_EX_RegWrite;
wire ID_EX_ALUSrcB;
wire ID_EX_ALUSrcA;
wire ID_EX_MemRead;
wire ID_EX_MemWrite;
wire ID_EX_MemtoReg;
wire [4:0]ID_EX_ALUControl;
wire [3:0]ID_EX_LoadType;
wire [2:0]ID_EX_SaveType;
ID_EX _ID_EX (
	 .clk(clk),
	 .rst_n(rst_n),
    .ID_RD1(ID_RD1), 
    .ID_RD2(ID_RD2), 
    .ID_Rs(ID_Rs), 
    .ID_Rt(ID_Rt), 
    .ID_Rd(ID_Rd),
	 .ID_Shamt(ID_Shamt),
    .ID_SignImm(ID_SignImm), 
    .ID_RegDst(ID_RegDst), 
    .ID_RegWrite(ID_RegWrite), 
    .ID_ALUSrcB(ID_ALUSrcB), 
	 .ID_ALUSrcA(ID_ALUSrcA), 
    .ID_MemRead(ID_MemRead), 
    .ID_MemWrite(ID_MemWrite), 
    .ID_MemtoReg(ID_MemtoReg), 
    .ID_ALUControl(ID_ALUControl), 
	 .Flush_EX(Flush_EX),
	 .ID_LoadType(ID_LoadType),
	 .ID_SaveType(ID_SaveType),
    .ID_EX_RD1(ID_EX_RD1), 
    .ID_EX_RD2(ID_EX_RD2), 
    .ID_EX_Rs(ID_EX_Rs), 
    .ID_EX_Rt(ID_EX_Rt), 
    .ID_EX_Rd(ID_EX_Rd),
	 .ID_EX_Shamt(ID_EX_Shamt),
    .ID_EX_SignImm(ID_EX_SignImm), 
    .ID_EX_RegDst(ID_EX_RegDst), 
    .ID_EX_RegWrite(ID_EX_RegWrite), 
    .ID_EX_ALUSrcB(ID_EX_ALUSrcB), 
	 .ID_EX_ALUSrcA(ID_EX_ALUSrcA),
    .ID_EX_MemRead(ID_EX_MemRead), 
    .ID_EX_MemWrite(ID_EX_MemWrite), 
    .ID_EX_MemtoReg(ID_EX_MemtoReg), 
    .ID_EX_ALUControl(ID_EX_ALUControl),
	 .ID_EX_LoadType(ID_EX_LoadType),
	 .ID_EX_SaveType(ID_EX_SaveType)
    );

wire [1:0]EX_ForwardA;
wire [1:0]EX_ForwardB;
wire [31:0]EX_MEM_ALUResult;
wire EX_RegWrite;
wire EX_MemRead;
wire EX_MemWrite;
wire EX_MemtoReg;
wire [4:0]EX_RegWriteA;
wire [31:0]EX_ALUResult;
wire [31:0]EX_WriteData;
wire [3:0]EX_LoadType;
wire [2:0]EX_SaveType;
EX _EX (
    .ID_EX_RD1(ID_EX_RD1), 
    .ID_EX_RD2(ID_EX_RD2), 
    .ID_EX_Rs(ID_EX_Rs), 
    .ID_EX_Rt(ID_EX_Rt), 
    .ID_EX_Rd(ID_EX_Rd),
	 .ID_EX_Shamt(ID_EX_Shamt),
    .ID_EX_SignImm(ID_EX_SignImm), 
    .ID_EX_RegDst(ID_EX_RegDst), 
    .ID_EX_RegWrite(ID_EX_RegWrite), 
    .ID_EX_ALUSrcB(ID_EX_ALUSrcB), 
	 .ID_EX_ALUSrcA(ID_EX_ALUSrcA), 
    .ID_EX_MemRead(ID_EX_MemRead), 
    .ID_EX_MemWrite(ID_EX_MemWrite), 
    .ID_EX_MemtoReg(ID_EX_MemtoReg), 
    .ID_EX_ALUControl(ID_EX_ALUControl), 
	 .ID_EX_LoadType(ID_EX_LoadType),
	 .ID_EX_SaveType(ID_EX_SaveType),
    .EX_ForwardA(EX_ForwardA), 
    .EX_ForwardB(EX_ForwardB), 
    .EX_MEM_ALUResult(EX_MEM_ALUResult), 
    .WB_Data(WB_Data), 
    .EX_RegWrite(EX_RegWrite), 
    .EX_MemRead(EX_MemRead), 
    .EX_MemWrite(EX_MemWrite), 
    .EX_MemtoReg(EX_MemtoReg), 
    .EX_RegWriteA(EX_RegWriteA), 
    .EX_ALUResult(EX_ALUResult), 
    .EX_WriteData(EX_WriteData),
	 .EX_LoadType(EX_LoadType),
	 .EX_SaveType(EX_SaveType)
    );
	
wire EX_MEM_RegWrite;
wire EX_MEM_MemRead;
wire EX_MEM_MemWrite;
wire EX_MEM_MemtoReg;
wire [4:0]EX_MEM_RegWriteA;
wire [31:0]EX_MEM_WriteData;
wire [3:0]EX_MEM_LoadType;
wire [2:0]EX_MEM_SaveType;	
EX_MEM _EX_MEM (
    .clk(clk), 
    .rst_n(rst_n), 
    .EX_RegWrite(EX_RegWrite), 
    .EX_MemRead(EX_MemRead), 
    .EX_MemWrite(EX_MemWrite), 
    .EX_MemtoReg(EX_MemtoReg), 
    .EX_WriteData(EX_WriteData), 
    .EX_RegWriteA(EX_RegWriteA), 
    .EX_ALUResult(EX_ALUResult), 
	 .EX_LoadType(EX_LoadType),
	 .EX_SaveType(EX_SaveType),
    .EX_MEM_RegWrite(EX_MEM_RegWrite), 
    .EX_MEM_MemRead(EX_MEM_MemRead), 
    .EX_MEM_MemWrite(EX_MEM_MemWrite), 
    .EX_MEM_MemtoReg(EX_MEM_MemtoReg), 
    .EX_MEM_RegWriteA(EX_MEM_RegWriteA), 
    .EX_MEM_ALUResult(EX_MEM_ALUResult), 
    .EX_MEM_WriteData(EX_MEM_WriteData),
	 .EX_MEM_LoadType(EX_MEM_LoadType),
	 .EX_MEM_SaveType(EX_MEM_SaveType)
    );
	 
wire [31:0]MEM_ReadData;
wire MEM_RegWrite;
wire MEM_MemtoReg;
wire [31:0]MEM_ALUResult;
wire [4:0]MEM_RegWriteA;
wire [3:0]MEM_LoadType;
MEM _MEM (
	 .clk(clk),
	 .rst_n(rst_n),
	 .Addr(Addr),
	 .SelectMode(SelectMode),
	 .data(data),
	 .sel(sel),
    .EX_MEM_RegWrite(EX_MEM_RegWrite), 
    .EX_MEM_MemRead(EX_MEM_MemRead), 
    .EX_MEM_MemWrite(EX_MEM_MemWrite), 
    .EX_MEM_MemtoReg(EX_MEM_MemtoReg), 
    .EX_MEM_RegWriteA(EX_MEM_RegWriteA), 
    .EX_MEM_ALUResult(EX_MEM_ALUResult), 
    .EX_MEM_WriteData(EX_MEM_WriteData), 
	 .EX_MEM_LoadType(EX_MEM_LoadType),
	 .EX_MEM_SaveType(EX_MEM_SaveType),
    .MEM_ReadData(MEM_ReadData), 
    .MEM_RegWrite(MEM_RegWrite), 
    .MEM_MemtoReg(MEM_MemtoReg), 
    .MEM_ALUResult(MEM_ALUResult), 
    .MEM_RegWriteA(MEM_RegWriteA),
	 .MEM_LoadType(MEM_LoadType)
    );

wire [31:0]MEM_WB_ReadData;
wire MEM_WB_MemtoReg;
wire [31:0]MEM_WB_ALUResult;
wire [4:0]MEM_WB_RegWriteA;
wire [3:0]MEM_WB_LoadType;	 
MEM_WB _MEM_WB (
    .clk(clk), 
    .rst_n(rst_n), 
    .MEM_ReadData(MEM_ReadData), 
    .MEM_RegWrite(MEM_RegWrite), 
    .MEM_MemtoReg(MEM_MemtoReg), 
    .MEM_ALUResult(MEM_ALUResult), 
    .MEM_RegWriteA(MEM_RegWriteA), 
	 .MEM_LoadType(MEM_LoadType),
    .MEM_WB_ReadData(MEM_WB_ReadData), 
    .MEM_WB_RegWrite(MEM_WB_RegWrite), 
    .MEM_WB_MemtoReg(MEM_WB_MemtoReg), 
    .MEM_WB_ALUResult(MEM_WB_ALUResult), 
    .MEM_WB_RegWriteA(MEM_WB_RegWriteA),
	 .MEM_WB_LoadType(MEM_WB_LoadType)
    );

WB _WB (
    .MEM_WB_ReadData(MEM_WB_ReadData), 
    .MEM_WB_RegWrite(MEM_WB_RegWrite), 
    .MEM_WB_MemtoReg(MEM_WB_MemtoReg), 
    .MEM_WB_ALUResult(MEM_WB_ALUResult), 
    .MEM_WB_RegWriteA(MEM_WB_RegWriteA), 
	 .MEM_WB_LoadType(MEM_WB_LoadType),
    .WB_Data(WB_Data),
	 .WB_RegWriteA(WB_RegWriteA),
	 .WB_RegWrite(WB_RegWrite)
    );
	 
Hazad _Hazard (
	 .clk(clk),
    .ID_Rs(ID_Rs), 
    .ID_Rt(ID_Rt),
	 .ID_Rd(ID_Rd),
	 .ID_PCSrc(ID_PCSrc),
	 .ID_Jump(ID_Jump),
	 .ID_Jumpr(ID_Jumpr),
	 .ID_BranchOp(ID_BranchOp),
	 .ID_Branch(ID_Branch),
    .ID_EX_Rs(ID_EX_Rs), 
    .ID_EX_Rt(ID_EX_Rt), 
    .ID_EX_RegWrite(ID_EX_RegWrite), 
    .EX_MEM_RegWrite(EX_MEM_RegWrite), 
	 .EX_MEM_MemtoReg(EX_MEM_MemtoReg),
    .MEM_WB_RegWrite(MEM_WB_RegWrite), 
    .WB_RegWrite(WB_RegWrite), 
    .EX_RegWriteA(EX_RegWriteA), 
    .EX_MEM_RegWriteA(EX_MEM_RegWriteA), 
    .MEM_WB_RegWriteA(MEM_WB_RegWriteA), 
    .WB_RegWriteA(WB_RegWriteA), 
    .EX_ForwardA(EX_ForwardA), 
    .EX_ForwardB(EX_ForwardB), 
    .ID_ForwardA(ID_ForwardA), 
    .ID_ForwardB(ID_ForwardB), 
    .Stall_IF(Stall_IF), 
    .Stall_ID(Stall_ID)
    );
endmodule

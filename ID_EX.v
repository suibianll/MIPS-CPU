module ID_EX(
	input clk,
	input rst_n,
	input [31:0]ID_RD1,
	input [31:0]ID_RD2,
	input [4:0]ID_Rs,
	input [4:0]ID_Rt,
	input [4:0]ID_Rd,
	input [4:0]ID_Shamt,
	input [31:0]ID_SignImm,
	input ID_RegDst,
	input ID_RegWrite,
	input ID_ALUSrcB,
	input ID_ALUSrcA,
	input ID_MemRead,
	input ID_MemWrite,
	input ID_MemtoReg,
	input [4:0]ID_ALUControl,
	input Flush_EX,
	input [3:0]ID_LoadType,
	input [2:0]ID_SaveType,
	output reg [31:0]ID_EX_RD1,
	output reg [31:0]ID_EX_RD2,
	output reg [4:0]ID_EX_Rs,
	output reg [4:0]ID_EX_Rt,
	output reg [4:0]ID_EX_Rd,
	output reg [4:0]ID_EX_Shamt,
	output reg [31:0]ID_EX_SignImm,
	output reg ID_EX_RegDst,
	output reg ID_EX_RegWrite,
	output reg ID_EX_ALUSrcB,
	output reg ID_EX_ALUSrcA,
	output reg ID_EX_MemRead,
	output reg ID_EX_MemWrite,
	output reg ID_EX_MemtoReg,
	output reg [4:0]ID_EX_ALUControl,
	output reg [3:0]ID_EX_LoadType,
	output reg [2:0]ID_EX_SaveType
    );
always@(posedge clk or negedge rst_n)
	if(~rst_n) begin
		ID_EX_RD1<=0;
		ID_EX_RD2<=0;
		ID_EX_Rs<=0;
		ID_EX_Rt<=0;
		ID_EX_Rd<=0;
		ID_EX_Shamt<=0;
		ID_EX_SignImm<=0;
		ID_EX_RegDst<=0;
		ID_EX_RegWrite<=0;
		ID_EX_ALUSrcB<=0;
		ID_EX_ALUSrcA<=0;
		ID_EX_MemRead<=0;
		ID_EX_MemWrite<=0;
		ID_EX_MemtoReg<=0;
		ID_EX_ALUControl<=0;
		ID_EX_LoadType<=0;
		ID_EX_SaveType<=0;
	end
	else if(Flush_EX)begin
		ID_EX_RD1<=0;
		ID_EX_RD2<=0;
		ID_EX_Rs<=0;
		ID_EX_Rt<=0;
		ID_EX_Rd<=0;
		ID_EX_Shamt<=0;
		ID_EX_SignImm<=0;
		ID_EX_RegDst<=0;
		ID_EX_RegWrite<=0;
		ID_EX_ALUSrcB<=0;
		ID_EX_ALUSrcA<=0;
		ID_EX_MemRead<=0;
		ID_EX_MemWrite<=0;
		ID_EX_MemtoReg<=0;
		ID_EX_ALUControl<=0;
		ID_EX_LoadType<=0;
		ID_EX_SaveType<=0;
	end
	else begin
		ID_EX_RD1<=ID_RD1;
		ID_EX_RD2<=ID_RD2;
		ID_EX_Rs<=ID_Rs;
		ID_EX_Rt<=ID_Rt;
		ID_EX_Rd<=ID_Rd;
		ID_EX_Shamt<=ID_Shamt;
		ID_EX_SignImm<=ID_SignImm;
		ID_EX_RegDst<=ID_RegDst;
		ID_EX_RegWrite<=ID_RegWrite;
		ID_EX_ALUSrcB<=ID_ALUSrcB;
		ID_EX_ALUSrcA<=ID_ALUSrcA;
		ID_EX_MemRead<=ID_MemRead;
		ID_EX_MemWrite<=ID_MemWrite;
		ID_EX_MemtoReg<=ID_MemtoReg;
		ID_EX_ALUControl<=ID_ALUControl;
		ID_EX_LoadType<=ID_LoadType;
		ID_EX_SaveType<=ID_SaveType;
	end
endmodule

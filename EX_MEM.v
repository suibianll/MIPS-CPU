module EX_MEM(
	input clk,
	input rst_n,
	input EX_RegWrite,
	input EX_MemRead,
	input EX_MemWrite,
	input EX_MemtoReg,
	input [31:0]EX_WriteData,
	input [4:0]EX_RegWriteA,//写回的寄存器地址
	input [31:0]EX_ALUResult,
	input [3:0]EX_LoadType,
	input [2:0]EX_SaveType,
	output reg EX_MEM_RegWrite,
	output reg EX_MEM_MemRead,
	output reg EX_MEM_MemWrite,
	output reg EX_MEM_MemtoReg,
	output reg [4:0]EX_MEM_RegWriteA,//写回的寄存器地址
	output reg [31:0]EX_MEM_ALUResult,
	output reg [31:0]EX_MEM_WriteData,
	output reg [3:0]EX_MEM_LoadType,
	output reg [2:0]EX_MEM_SaveType
    );
always@(posedge clk or negedge rst_n)
	if(~rst_n) begin
		EX_MEM_RegWrite<=0;
		EX_MEM_MemRead<=0;
		EX_MEM_MemWrite<=0;
		EX_MEM_MemtoReg<=0;
		EX_MEM_RegWriteA<=0;
		EX_MEM_ALUResult<=0;
		EX_MEM_WriteData<=0;
		EX_MEM_LoadType<=0;
		EX_MEM_SaveType<=0;
	end
	else begin
		EX_MEM_RegWrite<=EX_RegWrite;
		EX_MEM_MemRead<=EX_MemRead;
		EX_MEM_MemWrite<=EX_MemWrite;
		EX_MEM_MemtoReg<=EX_MemtoReg;
		EX_MEM_RegWriteA<=EX_RegWriteA;
		EX_MEM_ALUResult<=EX_ALUResult;
		EX_MEM_WriteData<=EX_WriteData;
		EX_MEM_LoadType<=EX_LoadType;
		EX_MEM_SaveType<=EX_SaveType;
	end
		
endmodule

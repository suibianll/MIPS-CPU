module MEM_WB(
	input clk,
	input rst_n,
	input [31:0]MEM_ReadData,
	input MEM_RegWrite,
	input MEM_MemtoReg,
	input [31:0]MEM_ALUResult,
	input [4:0]MEM_RegWriteA,
	input [3:0]MEM_LoadType,
	output reg [31:0]MEM_WB_ReadData,
	output reg MEM_WB_RegWrite,
	output reg MEM_WB_MemtoReg,
	output reg [31:0]MEM_WB_ALUResult,
	output reg [4:0]MEM_WB_RegWriteA,
	output reg [3:0]MEM_WB_LoadType
    );
always@(posedge clk or negedge rst_n)
	if(~rst_n) begin
		MEM_WB_ReadData<=0;
		MEM_WB_RegWrite<=0;
		MEM_WB_MemtoReg<=0;
		MEM_WB_ALUResult<=0;
		MEM_WB_RegWriteA<=0;
		MEM_WB_LoadType<=0;
	end
	else begin
		MEM_WB_ReadData<=MEM_ReadData;
		MEM_WB_RegWrite<=MEM_RegWrite;
		MEM_WB_MemtoReg<=MEM_MemtoReg;
		MEM_WB_ALUResult<=MEM_ALUResult;
		MEM_WB_RegWriteA<=MEM_RegWriteA;
		MEM_WB_LoadType<=MEM_LoadType;
	end

endmodule

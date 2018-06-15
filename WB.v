module WB(
	input [31:0]MEM_WB_ReadData,
	input MEM_WB_RegWrite,
	input MEM_WB_MemtoReg,
	input [31:0]MEM_WB_ALUResult,
	input [4:0]MEM_WB_RegWriteA,
	input [3:0]MEM_WB_LoadType,
	output [31:0]WB_Data,
	output [4:0]WB_RegWriteA,
	output WB_RegWrite
    );
wire [31:0]SplitData;
SplitWord Split (
    .MEM_WB_ReadData(MEM_WB_ReadData), 
    .SelectWord(MEM_WB_ALUResult[1:0]), 
    .MEM_WB_LoadType(MEM_WB_LoadType), 
    .SplitData(SplitData)
    );
assign WB_Data=MEM_WB_MemtoReg?SplitData:MEM_WB_ALUResult;
assign WB_RegWriteA=MEM_WB_RegWriteA;
assign WB_RegWrite=MEM_WB_RegWrite;
endmodule

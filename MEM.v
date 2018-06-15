module MEM(
	input clk,
	input rst_n,
	input [6:0]Addr,
	input SelectMode,
	output [7:0]data,
	output [3:0]sel,
	input EX_MEM_RegWrite,
	input EX_MEM_MemRead,
	input EX_MEM_MemWrite,
	input EX_MEM_MemtoReg,
	input [4:0]EX_MEM_RegWriteA,//Ð´»ØµÄ¼Ä´æÆ÷µØÖ·
	input [31:0]EX_MEM_ALUResult,
	input [31:0]EX_MEM_WriteData,
	input [3:0]EX_MEM_LoadType,
	input [2:0]EX_MEM_SaveType,
	output [31:0]MEM_ReadData,
	output MEM_RegWrite,
	output MEM_MemtoReg,
	output [31:0]MEM_ALUResult,
	output [4:0]MEM_RegWriteA,
	output [3:0]MEM_LoadType
    );
	 `include "para_def.v"
assign MEM_RegWrite=EX_MEM_RegWrite;
assign MEM_MemtoReg=EX_MEM_MemtoReg;
assign MEM_ALUResult=EX_MEM_ALUResult;
assign MEM_RegWriteA=EX_MEM_RegWriteA;
assign MEM_LoadType=EX_MEM_LoadType;
wire [31:0]dpo;
reg [31:0]WriteData;
always@*
	case(EX_MEM_SaveType)
		Type_SW: WriteData=EX_MEM_WriteData;
		Type_SB: WriteData={{24'b0},{EX_MEM_WriteData[7:0]}};//´æµÍ×Ö½Ú
		Type_SH: WriteData={{16'b0},{EX_MEM_WriteData[15:0]}};//µÍ16Î»
		Type_SWL: WriteData={{EX_MEM_WriteData[31:16]},{16'b0}};//×ó°ë×Ö
		Type_SWR: WriteData={{16'b0},{EX_MEM_WriteData[15:0]}};//ÓÒ°ë×Ö
	endcase
	
/*×ÔÔöµÄµØÖ·*/
reg [31:0]count;
reg [6:0]auto_inc_Addr;
always@(posedge clk or negedge rst_n)
	if(~rst_n) begin
		count<=0;
		auto_inc_Addr<=0;
	end
	else 
		if(count==10000000) begin
			count<=0;
			if(auto_inc_Addr==7'd127)
				auto_inc_Addr<=0;
			else
				auto_inc_Addr<=auto_inc_Addr+1;
		end
		else
			count<=count+1;
reg [6:0]R_Addr;
always@*
	if(SelectMode)
		R_Addr=auto_inc_Addr;
	else
		R_Addr=Addr;
Data_Mem _Data (
  .a(EX_MEM_ALUResult[6:0]),				// input [6 : 0] a
  .d(WriteData), 								// input [31 : 0] d
  .dpra(R_Addr), 			  					// input [6 : 0] dpra
  .clk(~clk), 									// input clk
  .we(EX_MEM_MemWrite), 					// input we
  .spo(MEM_ReadData), 						// output [31 : 0] spo
  .dpo(dpo) 									// output [31 : 0] dpo
);
DisPlay _Display (
    .clk(clk), 
    .reset_n(rst_n), 
    .q_a(dpo[15:0]), 
    .data(data), 
    .sel(sel)
    );


endmodule

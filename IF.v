module IF(
	input clk,
	input rst_n,
	input [31:0]nPC_P1,					//正常+1之后得到的PC值
	input [31:0]nPC_BJ,					//由跳转指令得到的PC值
	input PCSrc,							//选择PC的信号
	input Stall_IF,							//暂停流水线
	output [31:0]PC_P1,					//PC加一
	output [31:0]Ins						//取出的指令
    );
reg [31:0]PC;
wire [31:0]PC_;
assign PC_P1=PC+1;
assign PC_=PCSrc?nPC_BJ:PC_P1;
always@(posedge clk or negedge rst_n)
	if(~rst_n)
		PC<=0;
	else if(~Stall_IF)
		PC<=PC_;
		
Ins_Mem _Ins (
  .a(PC[6:0]), 					// input [6 : 0] a
  .spo(Ins) 						// output [31 : 0] spo
);
endmodule

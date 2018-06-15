module IF(
	input clk,
	input rst_n,
	input [31:0]nPC_P1,					//����+1֮��õ���PCֵ
	input [31:0]nPC_BJ,					//����תָ��õ���PCֵ
	input PCSrc,							//ѡ��PC���ź�
	input Stall_IF,							//��ͣ��ˮ��
	output [31:0]PC_P1,					//PC��һ
	output [31:0]Ins						//ȡ����ָ��
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

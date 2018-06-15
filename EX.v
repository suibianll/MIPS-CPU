module EX(
	input [31:0]ID_EX_RD1,
	input [31:0]ID_EX_RD2,
	input [4:0]ID_EX_Rs,
	input [4:0]ID_EX_Rt,
	input [4:0]ID_EX_Rd,
	input [4:0]ID_EX_Shamt,
	input [31:0]ID_EX_SignImm,
	input ID_EX_RegDst,
	input ID_EX_RegWrite,
	input ID_EX_ALUSrcB,
	input ID_EX_ALUSrcA,
	input ID_EX_MemRead,
	input ID_EX_MemWrite,
	input ID_EX_MemtoReg,
	input [4:0]ID_EX_ALUControl,
	input [3:0]ID_EX_LoadType,
	input [2:0]ID_EX_SaveType,
	input [1:0]EX_ForwardA,
	input [1:0]EX_ForwardB,//ת����־
	input [31:0]EX_MEM_ALUResult,
	input [31:0]WB_Data,//д�ؽ׶ε����ݣ��Ӵ洢�����������ݻ�����ALU�Ľ��
	output EX_RegWrite,
	output EX_MemRead,
	output EX_MemWrite,
	output EX_MemtoReg,
	output [4:0]EX_RegWriteA,//д�صļĴ�����ַ
	output [31:0]EX_ALUResult,
	output [31:0]EX_WriteData,//д���洢������ֵ
	output [3:0]EX_LoadType,
	output [2:0]EX_SaveType
    );
assign EX_RegWrite=ID_EX_RegWrite;
assign EX_MemRead=ID_EX_MemRead;
assign EX_MemWrite=ID_EX_MemWrite;
assign EX_MemtoReg=ID_EX_MemtoReg;	 
assign EX_LoadType=ID_EX_LoadType;
assign EX_SaveType=ID_EX_SaveType;
reg [31:0]SrcA_;
wire [31:0]SrcA;
reg [31:0]SrcB_;
wire [31:0]SrcB;
assign EX_RegWriteA=ID_EX_RegDst?ID_EX_Rd:ID_EX_Rt;//ѡ��Ŀ��Ĵ���
always@*								//ѡ��ALU��SrcA
	case(EX_ForwardA)
		2'b00: SrcA_=ID_EX_RD1;
		2'b01: SrcA_=WB_Data;
		2'b10: SrcA_=EX_MEM_ALUResult;
		default: SrcA_=ID_EX_RD1;
	endcase
always@*
	case(EX_ForwardB)
		2'b00: SrcB_=ID_EX_RD2;
		2'b01: SrcB_=WB_Data;
		2'b10: SrcB_=EX_MEM_ALUResult;
		default: SrcB_=ID_EX_RD2;
	endcase
assign SrcB=ID_EX_ALUSrcB?ID_EX_SignImm:SrcB_;//����ALUSrcBѡ����������Ĵ���ֵ��Ϊ1ʱѡ������
assign SrcA=ID_EX_ALUSrcA?{{27'b0},{ID_EX_Shamt}}:SrcA_;//
assign EX_WriteData=SrcB_;
alu ALU (
    .alu_a(SrcA), 
    .alu_b(SrcB), 
    .alu_op(ID_EX_ALUControl), 
    .alu_out(EX_ALUResult)
    );

endmodule

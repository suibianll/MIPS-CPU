module Hazad(
	input clk,
	input [4:0]ID_Rs,
	input [4:0]ID_Rt,
	input [4:0]ID_Rd,
	input ID_PCSrc,
	input ID_Jump,
	input ID_Jumpr,
	input [2:0]ID_BranchOp,
	input ID_Branch,
	input [4:0]ID_EX_Rs,
	input [4:0]ID_EX_Rt,
	input ID_EX_RegWrite,
	input EX_MEM_RegWrite,
	input EX_MEM_MemtoReg,
	input MEM_WB_RegWrite,
	input WB_RegWrite,
	input [4:0]EX_RegWriteA,
	input [4:0]EX_MEM_RegWriteA,
	input [4:0]MEM_WB_RegWriteA,
	input [4:0]WB_RegWriteA,
	output reg [1:0]EX_ForwardA,
	output reg [1:0]EX_ForwardB,
	output reg ID_ForwardA,
	output reg ID_ForwardB,
	output reg Stall_IF,//停顿PC寄存器
	output reg Stall_ID,//停顿IF_ID寄存器
	output reg Flush_EX//清空ID_EX寄存器
    );
reg [2:0]BranchOp;
reg temp=0;
always@*
	begin
		EX_ForwardA=2'b00;
		EX_ForwardB=2'b00;
		ID_ForwardA=0;
		ID_ForwardB=0;
		Stall_IF=0;
		Stall_ID=0;
		Flush_EX=0;
		BranchOp=ID_BranchOp;
		if(EX_MEM_RegWrite&(ID_EX_Rs==EX_MEM_RegWriteA)&(~EX_MEM_MemtoReg))
			EX_ForwardA=2'b10;
		else if(EX_MEM_RegWrite&(ID_EX_Rs==EX_MEM_RegWriteA)&(EX_MEM_MemtoReg))begin//lw后运算，只能将流水暂停
			Stall_IF=1;
			Stall_ID=1;
			Flush_EX=1;
		end
		else if(MEM_WB_RegWrite&(ID_EX_Rs==MEM_WB_RegWriteA))
			EX_ForwardA=2'b01;
		if(EX_MEM_RegWrite&(ID_EX_Rt==EX_MEM_RegWriteA)&(~EX_MEM_MemtoReg))
			EX_ForwardB=2'b10;
		else if(EX_MEM_RegWrite&(ID_EX_Rs==EX_MEM_RegWriteA)&(EX_MEM_MemtoReg))begin//lw后运算，只能将流水暂停
			Stall_IF=1;
			Stall_ID=1;
			Flush_EX=1;
		end
		else if(MEM_WB_RegWrite&(ID_EX_Rt==MEM_WB_RegWriteA))
			EX_ForwardB=2'b01;
		if(WB_RegWrite&(ID_Rs==WB_RegWriteA))
			ID_ForwardA=1;
		else if(WB_RegWrite&(ID_Rt==WB_RegWriteA))
			ID_ForwardB=1;
		if(ID_EX_RegWrite&(ID_Rt==EX_RegWriteA)&ID_Rt!=0) begin//sw,lw
			Stall_IF=1;
			Stall_ID=1;
			Flush_EX=1;
		end
		if(ID_Branch)begin
			if((BranchOp==4'd0)|(BranchOp==4'd5))begin//beq,bne
				if((((ID_Rs==EX_RegWriteA)|(ID_Rt==EX_RegWriteA))&ID_EX_RegWrite)|(((ID_Rs==EX_MEM_RegWriteA)|(ID_Rt==EX_MEM_RegWriteA))&EX_MEM_RegWrite)
					/*|((ID_Rs==MEM_WB_RegWriteA)|(ID_Rt==MEM_WB_RegWriteA)&MEM_WB_RegWrite)*/)begin
					Stall_IF=1;
					Stall_ID=1;
					Flush_EX=1;
				end
				else begin
					Stall_IF=0;
					Stall_ID=0;
					Flush_EX=0;
				end
			end
			else begin
				if(((ID_Rs==EX_RegWriteA)&ID_EX_RegWrite)|((ID_Rs==EX_MEM_RegWriteA)&EX_MEM_RegWrite)/*|((ID_Rs==MEM_WB_RegWriteA)&MEM_WB_RegWrite)*/)begin//bgtz,bgez,bltz,blez
					Stall_IF=1;
					Stall_ID=1;
					Flush_EX=1;
				end
				else begin
					Stall_IF=0;
					Stall_ID=0;
					Flush_EX=0;
				end
			end
		end
		if((ID_Jumpr&ID_PCSrc&(ID_Rs==EX_RegWriteA)&ID_EX_RegWrite)|(ID_Jumpr&ID_PCSrc&(ID_Rs==EX_MEM_RegWriteA&EX_MEM_RegWrite)))begin//jr指令
			Stall_IF=1;
			Stall_ID=1;
			Flush_EX=1;
		end
/*		if(ID_PCSrc)begin//j
			if(~temp)begin
				Stall_IF=1;
				Stall_ID=1;
				temp=~temp;
			end
			else begin
				Stall_IF=0;
				Stall_ID=0;
			end
		end*/
		
	end

endmodule

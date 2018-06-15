module IF_ID(//暂存PC值和指令
	input clk,
	input rst_n,
	input [31:0]Ins,
	input [31:0]PC_P1,
	input Stall_ID,
	input ID_PCSrc,
	output reg [31:0]IF_ID_Ins,
	output reg [31:0]IF_ID_PC_P1
    );
always@(posedge clk or negedge rst_n)
	if(~rst_n) begin
		IF_ID_Ins<=32'h0;
		IF_ID_PC_P1<=32'h0;
	end	
	else if(~Stall_ID)begin
		IF_ID_Ins<=Ins;
		IF_ID_PC_P1<=PC_P1;
		if(ID_PCSrc) begin//跳转指令生效
			IF_ID_Ins<=0;
			IF_ID_PC_P1<=0;
		end
	end

endmodule

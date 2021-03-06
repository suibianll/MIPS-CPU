
module REG_FILE(
	input clk,
	input rst_n,
	input [4:0] rAddr1,
	input [4:0] rAddr2,
	output [31:0] rDout1,
	output [31:0] rDout2,
	input [4:0] wAddr, 
	input [31:0] wDin,
	input wEna
    );
	reg [31:0] register[31:0];
assign rDout1=register[rAddr1];
assign rDout2=register[rAddr2];
always@(posedge clk or negedge rst_n)
	if(~rst_n)
		begin
         register[0]=0; 
         register[1]=0; 
         register[2]=0; 
         register[3]=0; 
         register[4]=0; 
         register[5]=0; 
         register[6]=0; 
         register[7]=0; 
         register[8]=0; 
         register[9]=0; 
         register[10]=0; 
         register[11]=0; 
         register[12]=0; 
         register[13]=0; 
         register[14]=0; 
         register[15]=0; 
         register[16]=0; 
         register[17]=0; 
         register[18]=0; 
         register[19]=0; 
         register[20]=0; 
         register[21]=0; 
         register[22]=0; 
         register[23]=0; 
         register[24]=0; 
         register[25]=0; 
         register[26]=0; 
         register[27]=0; 
         register[28]=0; 
         register[29]=0; 
         register[30]=0; 
         register[31]=0;  
		end 
	else
		begin
			if(wEna)
				begin
					register[wAddr]=wDin;
				end
			else
				register[wAddr]=register[wAddr];
		end
endmodule

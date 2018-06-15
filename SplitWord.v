module SplitWord(
	input [31:0]MEM_WB_ReadData,
	input [1:0]SelectWord,
	input [3:0]MEM_WB_LoadType,
	output reg [31:0]SplitData
    );
`include "para_def.v"
always@*
	case(MEM_WB_LoadType)
		Type_LW: SplitData=MEM_WB_ReadData;
		Type_LB: begin
			case(SelectWord)
				2'b00: SplitData={{24{MEM_WB_ReadData[7]}},{MEM_WB_ReadData[7:0]}};
				2'b01: SplitData={{24{MEM_WB_ReadData[15]}},{MEM_WB_ReadData[15:8]}};
				2'b10: SplitData={{24{MEM_WB_ReadData[23]}},{MEM_WB_ReadData[23:16]}};
				2'b11: SplitData={{24{MEM_WB_ReadData[31]}},{MEM_WB_ReadData[31:24]}};
			endcase
		end
		Type_LBU: begin
			case(SelectWord)
				2'b00: SplitData={{24'b0},{MEM_WB_ReadData[7:0]}};
				2'b01: SplitData={{24'b0},{MEM_WB_ReadData[15:8]}};
				2'b10: SplitData={{24'b0},{MEM_WB_ReadData[23:16]}};
				2'b11: SplitData={{24'b0},{MEM_WB_ReadData[31:24]}};
			endcase
		end
		Type_LH: begin
			if((SelectWord==2'h0)|(SelectWord==2'h1))
				SplitData={{16{MEM_WB_ReadData[15]}},{MEM_WB_ReadData[15:0]}};
			else if((SelectWord==2'h2)|(SelectWord==2'h3))
				SplitData={{16{MEM_WB_ReadData[31]}},{MEM_WB_ReadData[31:16]}};
		end
		Type_LHU: begin
			if((SelectWord==2'h0)|(SelectWord==2'h1))
				SplitData={{16'b0},{MEM_WB_ReadData[15:0]}};
			else if((SelectWord==2'h2)|(SelectWord==2'h3))
				SplitData={{16'b0},{MEM_WB_ReadData[31:16]}};
		end
		Type_LWL: SplitData={MEM_WB_ReadData[31:16],16'b0};
		Type_LWR: SplitData={16'b0,MEM_WB_ReadData[15:0]};
	endcase

endmodule

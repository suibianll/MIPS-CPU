`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:11:59 06/03/2018
// Design Name:   top
// Module Name:   F:/xilinx/workspace/Pipeline_CPU/test.v
// Project Name:  Pipeline_CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk;
	reg rst_n;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.rst_n(rst_n)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#10;clk=~clk;rst_n=1;#10;clk=~clk;rst_n=1;#10;clk=~clk;rst_n=1;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
		#10;clk=~clk;
      
		
		// Add stimulus here

	end
      
endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2021 09:44:37 PM
// Design Name: 
// Module Name: mux2_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux2_1(out,in0,in1,sel);
parameter WIDTH=32;
output	[WIDTH-1:0]	out;
input	[WIDTH-1:0]	in0;
input	[WIDTH-1:0]	in1;
input				sel;

assign out=sel?in1:in0;

endmodule
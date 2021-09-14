`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2021 08:56:15 PM
// Design Name: 
// Module Name: fullAdder2
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


module fullAdder2(
    output cout,
    output s,
    input a,
    input b,
    input cin
    );

assign {cout,s} = a + b + cin;

endmodule

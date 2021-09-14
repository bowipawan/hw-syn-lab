`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2021 08:56:15 PM
// Design Name: 
// Module Name: fullAdder1
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


module fullAdder1(
    output cout,
    output s,
    input a,
    input b,
    input cin
    );
reg cout, s;
always @(a or b or cin)
begin
    {cout,s}=a+b+cin;
end
endmodule

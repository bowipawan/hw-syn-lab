`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2021 09:49:00 PM
// Design Name: 
// Module Name: dFlipFlop
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


module dFlipFlop(
    output reg q,
    output reg qn,
    input wire clk,
    input wire d
    );

initial
begin
    q=0;
    qn=1;
end

always @(posedge clk)
begin
    q=d;
    qn=~d;
end
endmodule

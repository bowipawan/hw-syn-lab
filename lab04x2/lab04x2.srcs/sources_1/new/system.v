`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2021 12:35:11 PM
// Design Name: 
// Module Name: system2
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


module system(
    output wire [6:0] seg,
    output wire dp,
    output wire [3:0] an,
    input wire clk,
    input wire [4:0] sw,
    input btnC,
    input btnU
    );

// clock
wire targetClk;
wire [18:0] tclk;
assign tclk[0]=clk;
genvar c;
generate for(c=0;c<18;c=c+1)
begin
    clockDiv fDiv(tclk[c+1],tclk[c]);
end
endgenerate
clockDiv fdivTarget(targetClk,tclk[18]);

// 7 segment
wire [3:0] num0;
wire [3:0] num1;
wire [3:0] num2;
wire [3:0] num3;
wire an0, an1, an2, an3;
assign an = {an3, an2, an1, an0};
quadSevenSeg q7seg(seg,dp,an0,an1,an2,an3,num0,num1,num2,num3,targetClk);

// input synchronizer
wire [4:0] q1,qn1,q,qn;
genvar j;
generate for (j=0;j<5;j=j+1)
begin
    dFlipFlop d1(q1[j],qn1[j],targetClk,sw[j]);
    dFlipFlop d(q[j],qn[j],targetClk,q1[j]);
end
endgenerate

rom rom({num1,num0}, q, targetClk);

endmodule

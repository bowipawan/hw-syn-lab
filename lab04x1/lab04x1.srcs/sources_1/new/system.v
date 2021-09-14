`timescale 1ns / 1ps

module system(
    output [6:0] seg,
    output dp,
    output [3:0] an,
    input clk,
    input [7:0] sw,
    input btnC,
    input btnU,
    input btnD
    );

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

wire [3:0] num0;
wire [3:0] num1;
wire [3:0] num2;
wire [3:0] num3;
wire an0, an1, an2, an3;
assign an = {an3, an2, an1, an0};
quadSevenSeg q7seg(seg,dp,an0,an1,an2,an3,num0,num1,num2,num3,targetClk);

wire push, pop, clear;
singlePulser sppu(push, btnU, targetClk);
singlePulser sppo(pop, btnC, targetClk);
singlePulser spc(clear, btnD, targetClk);

ram stack({num3,num2}, {num1,num0}, sw, pop, push, clear, targetClk);

endmodule
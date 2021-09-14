`timescale 1ns / 1ps

module system(
    output [6:0] seg,
    output dp,
    output [3:0] an,
    input clk,
    input [7:0] sw,
    input btnC,
    input btnU
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

wire [7:0] q1,qn1,q,qn;
genvar j;
generate for (j=0;j<8;j=j+1)
begin
    dFlipFlop d1(q1[j],qn1[j],targetClk,sw[j]);
    dFlipFlop d(q[j],qn[j],targetClk,q1[j]);
end
endgenerate

singlePulser spu0(up0,q[1],targetClk);
singlePulser spu1(up1,q[3],targetClk);
singlePulser spu2(up2,q[5],targetClk);
singlePulser spu3(up3,q[7],targetClk);
singlePulser spd0(down0,q[0],targetClk);
singlePulser spd1(down1,q[2],targetClk);
singlePulser spd2(down2,q[4],targetClk);
singlePulser spd3(down3,q[6],targetClk);

wire c0, c1, c2, c3;
wire b0, b1, b2, b3;

bcd bcd0(num0,c0,b0,up0,down0,btnU|c3,btnC|b3,targetClk);
bcd bcd1(num1,c1,b1,up1|c0,down1|b0,btnU|c3,btnC|b3,targetClk);
bcd bcd2(num2,c2,b2,up2|c1,down2|b1,btnU|c3,btnC|b3,targetClk);
bcd bcd3(num3,c3,b3,up3|c2,down3|b2,btnU|c3,btnC|b3,targetClk);
endmodule
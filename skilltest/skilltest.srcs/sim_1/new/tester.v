`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2021 11:20:13 PM
// Design Name: 
// Module Name: tester
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


module tester(

    );

wire [6:0] seg;
wire dp;
wire [3:0] an;
reg clk;


always    #10 clk=~clk;

initial
begin
    #0;
    clk = 0;
end

// clock
//wire targetClk;
//wire [18:0] tclk;
//assign tclk[0]=clk;
//genvar c;
//generate for(c=0;c<18;c=c+1)
//begin
//    clockDiv fDiv(tclk[c+1],tclk[c]);
//end
//endgenerate
//clockDiv fdivTarget(targetClk,tclk[18]);

// counter
// 1 sec = 10 ns * 2^27
wire targetCount;
wire [2:0] cclk;
assign cclk[0]=clk;
genvar i;
generate for(i=0;i<2;i=i+1)
begin
    clockDiv cDiv(cclk[i+1],cclk[i]);
end
endgenerate
clockDiv cdivTarget(targetCount,cclk[2]);

// 7 segment
reg [3:0] num0;
reg [3:0] num1;
reg [3:0] num2;
reg [3:0] num3;
reg dp_in;
wire an0, an1, an2, an3;
assign an = {an3, an2, an1, an0};
quadSevenSeg q7seg(seg,dp,an0,an1,an2,an3,num0,num1,num2,num3,dp_in,clk);

initial {num3,num2,num1,num0} = 0;

always @(targetCount)
begin
    case(targetCount)
        0: begin // month-date
            num3 = 0;
            num2 = 7;
            num1 = 1;
            num0 = 8;
            dp_in = 0;
        end
        1: begin // year
            num3 = 1;
            num2 = 9;
            num1 = 9;
            num0 = 6;
            dp_in = 1;
        end
    endcase
end

endmodule

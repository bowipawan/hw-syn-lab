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
    input wire [7:0] sw,
    input btnU,
    input btnL,
    input btnD,
    input btnR
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
reg [3:0] num0;
reg [3:0] num1;
reg [3:0] num2;
reg [3:0] num3;
wire an0, an1, an2, an3;
assign an = {an3, an2, an1, an0};
quadSevenSeg q7seg(seg,dp,an0,an1,an2,an3,num0,num1,num2,num3,targetClk);

reg [1:0] mode;
reg [15:0] rom [16*16*4-1:0];
initial $readmemb("rom3.data", rom);

always@(posedge targetClk && (btnU || btnL || btnD || btnR))
begin
    case ({btnU,btnL,btnD,btnR})
        4'b1000: mode = 2'b00;
        4'b0100: mode = 2'b01;
        4'b0010: mode = 2'b10;
        4'b0001: mode = 2'b11;
    endcase
    {num3,num2,num1,num0} = rom[{mode,sw[7:0]}];
end
endmodule

`timescale 1ns / 1ps

module quadSevenSeg(
    output [6:0] seg,
    output dp,
    output an0,
    output an1,
    output an2,
    output an3,
    input [3:0] num0,
    input [3:0] num1,
    input [3:0] num2,
    input [3:0] num3,
    input dp_in,
    input clk
    );
    
reg [1:0] ns;
reg [1:0] ps;
reg [3:0] dispEn;
reg dp;

reg [3:0] hexIn;
wire [6:0] segments;
assign seg=segments;

hexTo7Segment segDecoder(segments, hexIn);
//assign dp=dp_in;
assign {an3,an2,an1,an0} = ~dispEn;
    
always @(posedge clk)
begin
    ps=ns;
end
    
always @(ps)
begin
    ns=ps+1;
end

always @(dispEn)
begin
    case(dispEn)
        4'b0001: dp=0;
        4'b0010: dp=1;
        4'b0100: dp=dp_in;
        4'b1000: dp=1;
    endcase
end
    
always @(ps)
begin
    case(ps)
        2'b00: dispEn=4'b0001;
        2'b01: dispEn=4'b0010;
        2'b10: dispEn=4'b0100;
        2'b11: dispEn=4'b1000;
    endcase
end

always @(ps)
begin
    case(ps)
        2'b00: hexIn=num0;
        2'b01: hexIn=num1;
        2'b10: hexIn=num2;
        2'b11: hexIn=num3;
    endcase
end
endmodule

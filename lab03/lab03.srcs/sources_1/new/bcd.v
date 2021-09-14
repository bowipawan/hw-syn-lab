`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2021 10:07:57 PM
// Design Name: 
// Module Name: bcd
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


module bcd(
    output reg[3:0] out,
    output reg cout,
    output reg bout,
    input wire up,
    input wire down,
    input wire set9,
    input wire set0,
    input wire clk
    );

initial out=0;

always @(posedge clk)
begin
    cout=0;
    bout=0;
    out=out+up-down;
    case ({set9,set0})
        2'b01: out=0;
        2'b10: out=9;
    endcase
    case (out)
        4'b1010:
            begin
                out=0;
                cout=1;
            end
        4'b1111:
            begin
                out=9;
                bout=1;
            end
    endcase
end
endmodule

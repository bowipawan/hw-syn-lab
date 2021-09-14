`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2021 09:42:40 PM
// Design Name: 
// Module Name: singlePulser
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


module singlePulser(
    output reg out,
    input wire in,
    input wire clk
    );

reg state;

initial state = 0;

always @(posedge clk)
begin
    out=0;
case ({state,in})
    2'b00: state = 0;
    2'b10: state = 0;
    2'b11: state = 1;
    2'b01:
    begin
        state=1;
        out=1;
    end
endcase
end
endmodule

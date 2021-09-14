`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2021 06:33:41 PM
// Design Name: 
// Module Name: ram
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


module ram (
    output reg [7:0] d_out,
    output reg [7:0] addr,
    input wire [7:0] d_in, // Data In and Out
    input wire oe , // Output Enable
    input wire we,
    input wire reset,
    input wire clk
    ) ;

reg [7:0] mem [255:0];

always @(posedge clk)
begin
if(we && addr < 255)
begin
    mem[addr] <= d_in;
    d_out = d_in;
    addr = addr+1;
end
if (oe && addr!=0)
begin
    d_out = mem[addr-1];
    mem[addr] <= 0;
    addr = addr-1;
end
if (reset)
begin
    addr = 0;
    d_out = 0;
end
end

endmodule

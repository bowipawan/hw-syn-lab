`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2021 10:36:56 PM
// Design Name: 
// Module Name: nano_sc_system
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

module nano_sc_system(
    output wire [6:0] seg,
    output [3:0] an,
    output dp,
    input clk,
    input [11:0] sw
);

wire 	[31:0]	p_address;
wire 	[31:0]	p_data;
wire	[31:0]	d_address;
wire	[31:0]	d_data;
wire mem_wr;
reg nreset = 1;

nanocpu	CPU(p_address, p_data, d_address, d_data, mem_wr, clk, nreset);
rom 	PROGMEM(p_data, p_address[17:2]);
memory 	DATAMEM(d_data, d_address[15:0], mem_wr, clk, sw, seg, an, dp);

endmodule
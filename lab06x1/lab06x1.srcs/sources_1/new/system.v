`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2021 09:43:38 PM
// Design Name: 
// Module Name: system
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
    output wire [3:0]vgaRed, vgaGreen, vgaBlue,
    output wire Hsync, Vsync,
    input wire [11:0]sw,
    input btnC, btnU, btnL, clk
    );
// btnU = switch
// btnC = update top color
vga_test vga(
    .clk(clk), 
    .sw(sw),
    .push({btnL, btnU}),
    .hsync(Hsync),
    .vsync(Vsync),
    .rgb({vgaRed, vgaGreen, vgaBlue})
);

endmodule

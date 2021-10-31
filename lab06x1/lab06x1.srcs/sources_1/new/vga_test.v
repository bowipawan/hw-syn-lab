`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2021 09:41:39 PM
// Design Name: 
// Module Name: vga_test
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


module vga_test(
    input wire clk,
    input wire [11:0] sw,
    input wire [1:0] push,
    output wire hsync, vsync,
    output wire [11:0] rgb
    );
    
parameter WIDTH = 640;
parameter HEIGHT = 480;

// register for Basys 2 8-bit RGB DAC 
reg [11:0] rgb_reg;
reg reset = 0;
wire [9:0] x, y;

// video status output from vga_sync to tell when to route out rgb signal to DAC
wire video_on;
wire p_tick;

// instantiate vga_sync
vga_sync vga_sync_unit (
    .clk(clk), .reset(reset), 
    .hsync(hsync), .vsync(vsync), .video_on(video_on), .p_tick(p_tick), 
    .x(x), .y(y)
    );
    
// compute gradient
reg state = 0;
reg [11:0] top_color = 0; // color at right or buttom
always @(posedge clk) begin
   if (push[0]) state = !state; // change direction
   if (push[1]) top_color <= sw; // load more color to gradient
end 

always @(posedge p_tick) // gradient weighted by coordinate
    if (!state) begin // horizontal
        rgb_reg[3:0] <= (((WIDTH - x) * sw[3:0]) + (x * top_color[3:0])) / WIDTH; // B
        rgb_reg[7:4] <= (((WIDTH - x) * sw[7:4]) + (x * top_color[7:4])) / WIDTH; // G
        rgb_reg[11:8] <= (((WIDTH - x) * sw[11:8]) + (x * top_color[11:8])) / WIDTH; // R
    end
    else begin // vertical
        rgb_reg[3:0] <= (((HEIGHT - y) * sw[3:0]) + (y * top_color[3:0])) / HEIGHT;
        rgb_reg[7:4] <= (((HEIGHT - y) * sw[7:4]) + (y * top_color[7:4])) / HEIGHT;
        rgb_reg[11:8] <= (((HEIGHT - y) * sw[11:8]) + (y * top_color[11:8])) / HEIGHT;
    end

// output
assign rgb = (video_on) ? rgb_reg : 12'b0;

endmodule
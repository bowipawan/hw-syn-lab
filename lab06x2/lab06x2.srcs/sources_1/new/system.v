`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2021 09:34:13 PM
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
    input clk,
    input RsRx,
    output RsTx
    );

reg ena, last_rec;
reg [7:0] data_in;
wire [7:0] data_out;
wire sent, received, baud;

baudrate baudrate(baud, clk);
receiver receiver(received, data_out, baud, RsRx);
transmitter transmitter(sent, RsTx, baud, data_in, ena);

always @(posedge baud)
begin
    if (ena == 1) ena = 0;
    if (~last_rec & received) begin
        data_in = data_out + 8'h01;
        if (data_in <= 8'h7A && data_in >= 8'h41) ena = 1;
    end
    last_rec = received;
end

endmodule

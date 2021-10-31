`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2021 09:38:31 PM
// Design Name: 
// Module Name: baudrate
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


module baudrate(
    output reg baud,
    input clk
    );

integer counter;
always @(posedge clk)
begin
    counter = counter + 1;
    if (counter == 325) begin
        counter = 0;
        baud = ~baud;
    end
end

endmodule

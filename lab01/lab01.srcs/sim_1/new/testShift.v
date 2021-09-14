`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2021 09:10:59 PM
// Design Name: 
// Module Name: testShift
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


module testShift(

    );
    
reg d,clock;
wire [1:0] qa,qb;

shiftA sa(qa,clock,d);
shiftB sb(qb,clock,d);

always
    #10 clock=~clock;
initial
begin
    #0 d=0;
    clock=0;
    #1000 $finish;
end
always
    #8 d=~d;

endmodule

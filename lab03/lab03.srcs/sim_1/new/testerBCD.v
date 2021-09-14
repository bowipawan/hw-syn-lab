`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2021 01:31:46 PM
// Design Name: 
// Module Name: testerBCD
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


module tester(

    );

reg clk, up, down, set9, set0;
wire bout, cout;
wire [3:0] outBCD;

bcd bcd1(outBCD, cout, bout, up, down, set9, set0, clk);

always #5 clk = ~clk;

initial
begin
    #0;
    clk = 0;
    up = 0;
    down = 0;
    set9 = 0;
    set0 = 0;
    
    // up
    #40 up=1;
    //down
    #200;
    up=0;
    down=1;
    #100 down=0;
    
    // set9
    #40;
    set9 = 1;
    #20 set9 = 0;
    
    // set0
    #40;
    set0 = 1;
    #10 set0 = 0;
    
    #400;
    $finish;
end
///////////////////////////////////////////////
wire out_sp;
reg in_sp;
singlePulser sp(out_sp, in_sp, clk);

initial
begin
     #0;
     in_sp = 0;
 
     #5 in_sp = 1;
     #5 in_sp = 0;
 
     #10 in_sp = 1;
     #45 in_sp = 0;
 
     #400;
     $finish;
end
endmodule

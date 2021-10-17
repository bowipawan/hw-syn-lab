`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2021 10:39:14 PM
// Design Name: 
// Module Name: rom
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

module rom(
    output	[DATA_WIDTH - 1:0] data,
    input	[ADDR_WIDTH - 1:0] address
    );

reg	[DATA_WIDTH - 1:0]	mem[0:2**ADDR_WIDTH];

assign data = mem[address];

initial begin
	$readmemb("prog.list", mem);
end

endmodule

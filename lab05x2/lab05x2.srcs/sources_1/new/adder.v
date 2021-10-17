module adder(S,Cout,A,B,Cin);
parameter WIDTH=31;
output	[WIDTH-1:0]	S;
output				Cout;
input	[WIDTH-1:0]	A;
input	[WIDTH-1:0]	B;
input				Cin;

assign {Cout,S}=A+B+Cin;

endmodule
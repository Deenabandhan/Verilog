
`timescale 1ns/100ps

module frbit_adder;
	wire [4:0] w;
	reg [3:0] a;
	reg [3:0] b;
	
	Frb t(w,a,b);
	initial
	begin
		$dumpfile("test_circuit.vcd");
		$dumpvars(0,frbit_adder);
		$monitor("a = %b b = %b and a+b = %b ",a,b,w);
		a=13; b=10;
		#10 a=1; b=0;
		#10 a=4; b=7;
		#10;
		
	end
endmodule
	


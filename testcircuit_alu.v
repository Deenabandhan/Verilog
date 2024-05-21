module test_MP;
	wire [4:0] out;
	reg [1:0] s;
	reg [3:0] a;
	reg [3:0] b;
	
	alu DUT(a,b,s,out);
	
	initial
	begin 
		$dumpfile("test_circuit.vcd");
		$dumpvars(0,test_MP);
		$monitor("At t=%t a=%b b=%b s=%b out=%b",$time,a,b,s,out[3:0]);
		s=1;
		a=5;
		b=5;
		#10 s=2;
		#10 s=0;
		#10 s=3;
		#10 s=1;
		#10 ;
	end
endmodule

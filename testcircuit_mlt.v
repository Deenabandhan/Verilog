module test_MP;
	wire out;
	reg [1:0] s;
	reg i0,i1,i2,i3;
	
	mlt DUT(out,i0,i1,i2,i3,s);
	
	initial
	begin 
		$dumpfile("test_circuit.vcd");
		$dumpvars(0,test_MP);
		$monitor("At t=%t i0=%b i1=%b i2=%b i3=%b s=%b out=%b",$time,i0,i1,i2,i3,s,out);
		i0=0;
		i1=1;
		i2=1;
		i3=0;
		s=1;
		#10 s=2;
		#10 s=0;
		#10 s=3;
		#10 s=1;
		#10 ;
	end
endmodule


module test_MP;
	wire i0,i1,i2,i3;
	reg [1:0] s;
	
	circuitdmB DUT(i0,i1,i2,i3,s);
	
	initial
	begin 
		$dumpfile("test_circuit.vcd");
		$dumpvars(0,test_MP);
		$monitor("At t=%t i0=%b i1=%b i2=%b i3=%b s=%b",$time,i0,i1,i2,i3,s);
		s=1;
		#10 s=2;
		#10 s=0;
		#10 s=3;
		#10 s=1;
		#10 ;
	end
endmodule

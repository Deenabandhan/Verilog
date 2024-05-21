`timescale 1ns/100ps

module test_FA;
	wire sum,cout;
	reg i0,i1,cin;
	FA_B DUT(sum,cout,i0,i1,cin);
	
	initial
	begin
		$dumpfile("test_circuit.vcd");
		$dumpvars(0,test_FA);
		$monitor("At t=%t i0=%b i1=%b cin=%b cout=%b sum=%b ",$time,i0,i1,cin,cout,sum);
		
		i0=0; i1=0; cin=0;
		#10 i0=1; i1=0; 
		#10 i0=0;i1=1;
		#10 i0=1; i1=1;
		#10;
	end
endmodule




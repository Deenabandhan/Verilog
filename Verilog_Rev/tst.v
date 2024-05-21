`timescale 1ns/100ps
// ` is used to include the compiler directory
/*module tst;
	// There is no input aand outputs here , It is just an interactive prog that gives commands
	// So inputs should be reg and outputs should be wires
	wire[15:0] S;
	//wire C;
	//reg[3:0] A,B;
	reg [15:0]A,B;
	//wire C,S;
	//e1 m1(A,B,C,D1);	
	//e2 m2(A,B,C,D2);
	//FA1 f1(A,B,S,C);
	//b1 e(A,B,C);
	ad2 a2(A,S);
	initial
	// statements under initial are executed once the stimulation starts to occur
		begin
			$dumpfile("tst_wave.vcd");
			$dumpvars(0,tst);
			A=16'b0;
			repeat(2<<16-1) #10 A+=1'b1;
			/*
			// BEGIN IS USED TO execute a set of statements under a block
			A=0000;B=0000;
			for(integer i=0;i<16;i++)
			begin
				for(integer j=0;j<15;j++)
				begin
					#10 B+=1;
				end
				#10 A+=1;B=0000;
			end
			A=0000;B=0000;
			repeat(15)
			begin
				repeat(15) #10 B+=1;
				#10 A+=1;
			end	
			#10;
					
		end
	//initial #2570 $finish;
	initial
		begin
			$display("A    S");
			$monitor("%b %d%d%d%d%d%d ryt?",A,S[15],S[14:12],S[11:9],S[8:6],S[5:3],S[2:0]);
		end
endmodule
*/
//Only one begin end statement for initial
//Each initial statement executes fromt he beginnng till the end
//monitor in the initial is executed only when the variables givem change


module tst2;
	reg J,K,clk,rst;
	wire Q;
	integer i=0;
	jk d1(J,K,clk,rst,Q);
	initial
		begin
			$dumpfile("tst_wave.vcd");
			$dumpvars(0,tst2);
			rst=0;clk=0;
			#10 rst=1;J=0;K=0;
			repeat(7) 
			begin
				#10 clk=~(clk);
				if((i%4)%2==1) K=1'b1;
				else if(i%4==2) 
				begin
					J=1'b1;
					K=1'b0;
				end
				else 
				begin
					J=1'b0;
					K=1'b0;
				end
				i+=1;
			end
			#10;
		end
	initial
		$monitor("J=%b K=%b Q=%b",J,K,Q);
endmodule
//Lesson learnt : even if it is a two variable assignment , do it in seperate lines


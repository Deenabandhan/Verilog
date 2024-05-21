//ALU


module alu(a,b,s,out);
	input [3:0] a;
	input [3:0] b;
	input  [1:0] s;
	output [4:0] out;
	reg [4:0] out1;

	
	always@(a or b or s)
	begin
		if(s==1)
		 	out1 =a & b;
		else if(s==2)
			 out1 =a | b;
		else if(s==3)
			out1 = ~(a & b);
		else
		begin
			out1=a+b;
			if(out1[4]==1) 
			begin
				$display("The sum is performed at t=%t and the end carry is %b",$time,out1[4]);
			end
		end
	end
	assign out=out1;
endmodule
			
			
			
			
			
			
			
			
			
			
			
			
			


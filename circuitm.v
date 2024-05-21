// Multiplexer

module mlt(out,i0,i1,i2,i3,s);
	input i0,i1,i2,i3;
	input [1:0] s;
	output out;
	reg out1;
	
	
	always@(i0 or i1 or i2 or i3 or s)
	begin
		if(s==0)
		 	out1=i0;
		else if(s==1)
			 out1=i1;
		else if(s==2)
			 out1=i2;
		else if(s==3)
			out1=i3;
	end 
	assign out=out1;
endmodule

module circuitS(out,i0,i1,i2,i3,s);
	input i0,i1,i2,i3;
	input [1:0] s;
	output out;
	reg out1;
	
	not n1(s1,s[1]);
	not n2(s2,s[0]);
	
	and a1(s3,s1,s2);
	and a2(p1,s3,i0);
	
	and a3(s4,s1,s[0]);
	and a4(p2,s4,i1);
	
	and a5(s5,s[1],s2);
	and a6(p3,s5,i2);
	
	and a7(s6,s[1],s[0]);
	and a8(p4,s6,i3);
	
	or o1(q1,p1,p2);
	or o2(q2,p3,p4);
	or o3(out,q1,q2);
endmodule
	
	

//Full Adder

module FA_S(sum,cout,a,b,cin);
	input a,b,cin;
	output cout,sum;
	wire s1,s2,s3,s4,s5;
	
	xor x1(s1,a,b);
	xor x2(sum,s1,cin);
	
	and a1(s2,a,b);
	and a2(s3,a,cin);
	and a3(s4,b,cin);
	or o1(s5,s2,s3);
	or o2(cout,s5,s4);
endmodule

module FA_B(sum,cout,a,b,cin);
	input a,b,cin;
	output cout,sum;
	wire s1,s2,s3,s4,s5;
	
	assign sum=s1 ^ cin;
	assign s1=a ^b;
	assign s2=a & b;
	assign s3=a & cin;
	assign s4=b & cin;
	assign s5=s2 | s3;
	assign cout=s5 | s4;
	
endmodule	

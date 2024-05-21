module HA(sum,cout,a,b);

	input a,b;
	output sum,cout;

	xor x1(sum,a,b);
	and x2(cout,a,b);

endmodule



module FA(sum,cout,a,b,cin);

	input a,b,cin;
	output sum,cout;
	wire s1,s2,s3,s4,s5;
	xor x1(s1,a,b);
	xor x2(sum,s1,cin);
	and a1(s2,a,b);
	and a2(s3,a,cin);
	and a3(s5,b,cin);
	or o1(s4,s2,s3);
	or o2(cout,s4,s5);

endmodule


module Frb(out,a,b);

	input [3:0] a;
	input [3:0] b;
	output [4:0] out;
	wire s0,s1,s2,s3,s4,h0;
	
	HA h(out[0],h0,a[0],b[0]);
	FA f1(out[1],h1,a[1],b[1],h0);
	FA f2(out[2],h2,a[2],b[2],h1);
	FA f3(out[3],out[4],a[3],b[3],h2);

endmodule



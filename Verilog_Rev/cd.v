//Revision notes
//Instead of compiling it creates a database storing the values
//Keywords : module , endmodule , input ,output
module e1(A,B,C,D);
	input A,B,C;
	output D;
	wire w1,w2;
	and a1(w1,A,B);
	not a2(w2,C);
	or a3(D,w1,w2);
endmodule

// Here sequential methods doesnt have any usage You are just defining what to do  

module e2(A,B,C,D);
	input A,B,C;
	output D;
	wire w1,w2;
	e3 i1(w1,A,B);
	e3 i2(D,w1,C);
	/*assign w1=(A&B);
	assign w2=~(C);
	assign D=(w1^w2);*/
endmodule

// Mistake : endmodule wont have semicolon
//eg2 is combinational logic
//primitive has output as the first element like not()
//not or and are all just primitives defined in the hdl library
//these modelling with primitives are called Gate-level modelling
// modelling with assign is called Data-flow modelling

primitive e3(C,A,B);
	input A,B;
	output C; 
	table
	0 0 : 0;
	0 1 : 1;
	1 0 : 1;
	1 1 : 0;
	endtable
endprimitive

module ha(S,C,a,b);
	input a,b;
	output S,C;
	assign S=(a^b);
	assign C=(a&b);
endmodule

module fa(S,C,a,b,c);
	input a,b,c;
	output S,C;
	wire w1;
	ha h1(w1,w2,a,b);
	ha h2(S,w3,w1,c);
	or o1(C,w3,w2);
endmodule	

module FA1(A,B,S,C);
	input [3:0] A,B;
	output [3:0] S;
	output C;
	wire c1,c2,c3;
	fa f1(S[0],c1,A[0],B[0],1'b0);
	fa f2(S[1],c2,A[1],B[1],c1);
	fa f3(S[2],c3,A[2],B[2],c2);
	fa f4(S[3],C,A[3],B[3],c3);
endmodule	
	
module FA2(A,B,S,C);
	input [3:0] A,B;
	output [3:0] S;
	output C;
	assign {C,S}=A+B;
endmodule
// The data-flow model has so many in-built symbols like {} is used to concatenate two variables 
/* 	+ is used to add two variables 
	- : subtract
	{> , < , ==} : greater than , less than , equal to
	? : is a comparator operator
*/
// assign a=(select>=8)?A:B;
	
//behavioural model must have output as reg
// It is used mostly in sequential circuits
//If statement can be used only in behavioural model

module b1(A,B,C);
	input A,B;
	output C;
	reg C;
	always@(A or B)
	if(A>B) assign C=A;
	else assign C=B;
endmodule

module ad1(A,B,C);
	input A,B;
	output reg[5:0] C;
	always@(A,B)
	if(A<B) C=6'b010101;
	else if(A>B) C=6'b011010;
	else C=6'b100011;
endmodule

//Lesson learnt never write a binary number in simple format ; write it with the prefix n'b

module ad2(A,B);
	input[15:0] A;
	output [15:0] B;
	assign B=A;
endmodule

//Single pass will never get over in single statement it will coninue forever eg : always initial
//We can modify it using two operators delay time operator # , event control operetor @	

//Event control operator takes care of the continuous assignment condition
//Blocking assignment will take place sequentially (a=b,b=a -> a=b=bi)
//Non-blocking assignment will take place concurrently (a<=b,b<=a -> a=bi,b=ai)


module D_F(D,clk,rst,Q);
	input D,clk,rst;
	output reg Q;
	always@(posedge clk,negedge rst)
	if(~(rst)) Q<=0;
	else Q<=D;
endmodule

module jk(J,K,clk,rst,Q);
	input J,K,clk,rst;
	output Q;
	wire w1,w2;
	assign w1=((J&~Q)|(~K&Q));
	D_F d(w1,clk,rst,Q);
endmodule

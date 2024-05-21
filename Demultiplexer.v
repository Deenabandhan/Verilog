// Demultiplexer


module circuitdmB(i0,i1,i2,i3,s);
	output i0,i1,i2,i3;
	input [1:0] s;
	reg i0,i1,i2,i3;
	parameter imp=1'bx;
	always@(i0 or i1 or i2 or i3 or s)
	begin
		if(s==0)
		begin
		 	i0=1;
		 	i1=imp;
		 	i2=imp;
		 	i3=imp;
		 	end
		else if(s==1)
		begin
			 i0=imp;
			 i1=1;
			 i2=imp;
			 i3=imp;
			 end
		else if(s==2)
		begin
			 i0=imp;
			 i1=imp;
			 i2=1;
			 i3=imp;
			 end
		else if(s==3)
		begin
			i0=imp;
			i1=imp;
			i2=imp;
			i3=1;
			end
	end 
endmodule

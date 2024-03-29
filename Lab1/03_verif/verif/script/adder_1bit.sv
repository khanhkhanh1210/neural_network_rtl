module adder_1bit(
	input a,b,cin,
	output logic sum, c_out
);
always@* begin
	sum = a^b^cin;
	c_out = a & b|cin&(a^b);
end
endmodule


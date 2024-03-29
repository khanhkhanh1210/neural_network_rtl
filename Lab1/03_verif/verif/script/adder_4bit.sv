module adder_4bit(
	input wire [3:0] a,b,
	input wire c_in,
	output wire [3:0] sum,
	output wire c_out
);
wire [3:0] tmp;
genvar i;
generate
	adder_1bit adder0(a[0],b[0],c_in,sum[0],tmp[0]);
	for(i = 1; i <= 3; i=i+1) begin: create_adder
		adder_1bit adder[i](a[i],b[i],tmp[i-1],sum[i],tmp[i]);
	end
	assign	c_out = tmp[3];
endgenerate
endmodule


module testtop;
logic [7:0] din, dout;
ReLU ReLU_dut(din, dout);
initial begin
	for(int i = 0; i < 2**8; i++)
		#10 din = i;
end
endmodule


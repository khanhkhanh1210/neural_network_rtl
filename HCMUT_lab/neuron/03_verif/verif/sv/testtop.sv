module testtop;
logic [31:0] din, dout;
ReLU ReLU_dut(din, dout);
initial begin
	din = 32'd20;
	for(int i = 0; i <= 3; i++) begin
		#10 din += 2;
		#10 din[31] = ~din[31];
	end	
end
endmodule


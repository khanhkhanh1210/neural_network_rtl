module ReLU #(parameter
	data_size = 8
)
(	input logic [data_size-1:0] din,
	output logic [data_size-1:0] dout
);
always_comb begin
	dout = din[data_size-1]? 0:dout;
end
endmodule


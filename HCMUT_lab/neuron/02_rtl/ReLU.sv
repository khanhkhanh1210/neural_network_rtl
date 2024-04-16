// 32 bit fixed-point
module ReLU #(parameter
	data_size = 32*2
)
(	input logic [data_size-1:0] din,
	output logic [data_size-1:0] dout
);
	assign dout = {data_size{~din[data_size-1]}} & din;
endmodule


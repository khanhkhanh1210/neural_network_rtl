module neuron #(parameter
	data_size = 32
)
(
	input logic clk, rst,
	input logic [data_size-1:0] bias,
	output logic [(2*data_size)-1:0] result_out
);
logic [data_size-1:0] weight_value, x_value, x_out, r_addr, weight_out, addr_end;
//linear regression
logic [(2*data_size)-1:0] y, y_out, result;
logic r_en, end_weight;

rom #(.weightfile("w_1_15.mif")) weight_rom(.r_addr(r_addr), .clk(clk), .r_en(r_en), .weight_out(weight_value));
rom #(.weightfile("x_value.mif")) input_value(.r_addr(r_addr), .clk(clk), .r_en(r_en), .weight_out(x_value));

always@(posedge clk) begin: MAC
	if(!end_weight)
		y <= y + weight_out*x_out;
end

always_comb begin: BIAS
	y_out = y + bias;
end

//control address value of weight and input 
always_ff@(posedge clk) begin
//if reach the end of weight value, set value to 0
	if(rst|end_weight) begin
		r_addr <= '0;
		result_out <= result;
	end
	else
		r_addr <= r_addr + 1;	
end

always_ff@(posedge clk) begin
	if(r_en) begin
		weight_out <= weight_value;
		x_out <= x_value;
	end
end
always_comb begin
	end_weight = (r_addr == addr_end);	//check if address reach the end
end

ReLU activation_func(y_out, result);	

endmodule

	

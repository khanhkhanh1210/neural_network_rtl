module neuron(
	input logic [7:0] x,w_in,
	input logic clk, w_en,
	output logic [7:0] w_out
);
logic [7:0] weight;
rom weight_value(1'b0, w_in, clk, w_en, weight);
always@(posedge clk) begin
	
end
endmodule

	

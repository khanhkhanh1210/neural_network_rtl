module rom #(parameter
	data_size = 32,
	addr_size = 32,
	weightfile = "w_1_15.mif"
)
(
	input logic [addr_size-1:0] r_addr,
//	input logic [data_size-1:0] w_data,
	input logic clk, r_en,
	output logic [data_size-1:0] weight_out
);
	logic [data_size:0] rom[2**addr_size-1:0];

	initial begin
		$readmemb(weightfile, rom);
	end
	always@(posedge clk) begin
//		if(w_en)
//			rom[w_addr] <= w_data;
        	if(r_en)
		        weight_out <= rom[r_addr];
	end
endmodule



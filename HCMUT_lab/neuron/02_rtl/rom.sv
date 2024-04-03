
module rom #(parameter
	data_size = 9,
	addr_size = 9,
	datafile = "w_1_15.mif"
)
(
	input logic [addr_size:0] addr,
	input logic [data_size:0] data,
	input logic clk, wr_en,
	output logic [data_size:0] q
);
	logic [data_size:0] rom[2**addr_size-1:0];

	initial begin
		$readmemb(datafile, rom);
	end

	always_comb begin
		q = rom[addr];
	end
	always@(posedge clk) begin
		if(wr_en)
			rom[addr] = data;
	end
endmodule



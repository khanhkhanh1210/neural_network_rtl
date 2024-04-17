module verilog_learn(
/* 2 types of datatpye, net and variable
	+ net: don't store value on its own, basically wire to connect 2 components */
		input wire [7:0] data1,
		input logic [7:0] data2,
		input logic clk,
		output wire [7:0] out
);
	// + variable: can hold value, ex: flipflop; reg can be represent as combinational logic
	reg [7:0] q1, b,c,d;
	//format without base_format is decimal by default, size depends on type (integer = 32 bits)
	integer a;
	//unsigned 64-bit wide, for debugging
	time end_time;
	// time store as floating point quantity
	realtime rtime; 
	//floating point value 
	real pi;
	//2's of 3 in 8 bits
	logic [7:0] value1;
	//string represent in verilog 
	reg [8*8:1] end_promt;
	//make code more easy to check
	typedef enum {true, false} verify;
	display_object display_pi;
	
	//always_ff force create ff
	always_ff@(posedge clk) 
		q <= data1;
		
	// create comb logic
	always_comb	
		b = c^d;
	
	always_latch
		if(c)
			d <= data2;

	initial begin
		value1 = 7'd3;
		a = 10;
		pi = 3.14;			
		end_promt = "End test";
		display_pi = object(pi);
		display_pi.display();
		verify checked;
		if(out)
			checked = true;
		else	
			checked = false;
		end_time = $time;
		$display ("End simulate: %s", end_promt);
	end
endmodule

typedef struct{
	int data_struct1;
	real data_struct2;
} data_struct;


class display_object;
	string a;
	real b;
	function object(string a);
		this.a = a;
	endfunction
	
	function object(real b);
		this.b = b;
	endfunction
	
	function display();
		$display("%s",this.a);
	endfunction
	
	function display();
		$display("%f",this.b);
	endfunction
endclass

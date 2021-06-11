//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8  - Simple End-to-End Design
// Student Name: Benjamin Sidebotham
// Date: 11/06/21
//
// Description: A testbench module to test Ex8
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb (
	);
    
	parameter CLK_PERIOD = 10;

	reg clk_p;
	wire clk_n;
	reg rst_n;
	reg [4:0] temp;
	wire heating;
	wire cooling;

	reg err = 0;
	reg dir = 1;
	
	initial begin   	
		clk_p = 1'b0;
		forever
		#(CLK_PERIOD/2) clk_p=~clk_p;
	end
	assign clk_n=~clk_p;

	initial	begin
	   forever begin
		#CLK_PERIOD
		if(cooling == 1 && heating == 1) begin
		   $display("TEST FAILED - cooling and heating can not be both on");
		   err=1;
		end
	   end
	end

	//test by cycling temp between 16 and 24
	initial begin
		temp = 5'b10000;
		forever begin
			#CLK_PERIOD
			temp = dir ? temp + 5'b00001 : temp - 5'b00001;
			if (temp > 5'b11000 || temp < 5'b10000)
				dir = ~dir;
		end

	end
	
	// logic
	initial begin
		#(CLK_PERIOD*3/4)
		forever begin
			#CLK_PERIOD
			//test cooling
			if ((cooling && (temp <= 5'b10100)) || !cooling && (temp >= 5'b10110))
				begin
				$display("COOLING TEST FAILED", temp, heating, cooling);
				err=1;
				end
			//test heating
			if ((heating && (temp >= 5'b10100)) || !heating && (temp <= 5'b10010))
				begin
				$display("HEATING TEST FAILED", temp, heating, cooling);
				err=1;
				end
		end
	end
		
	// finish test
	initial begin
		#250
		if (err==0)
			$display("TEST PASSED");
		$finish;
	end	
	
	top top (
	.clk_p(clk_p),
	.clk_n(clk_n),
	.rst_n(rst_n),
	.temperature_0 (temp[0]), 
	.temperature_1 (temp[1]), 
	.temperature_2 (temp[2]),
	.temperature_3 (temp[3]), 
	.temperature_4 (temp[4]),
	.heating(heating),
	.cooling(cooling)
	);

endmodule

	

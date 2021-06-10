//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name: Benjamin Sidebotham
// Date: 09/06/21
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb (
	);

	parameter CLK_PERIOD = 10;
	
	reg clk;
	reg enable;
	reg [2:0] colour;
	wire [23:0] rgb;

	reg err;
	reg [23:0] rgb_prev;

	//clock
	initial begin
		clk = 1'b0;
		forever
			#(CLK_PERIOD/2) clk=~clk;
	end

	//logic
	initial begin
		err = 0;
		colour = 2'b0;
		rgb_prev = rgb;
		enable = 1;
		#CLK_PERIOD
		if (rgb != rgb_prev) begin
			$display("TEST FAILED - NOT THE RIGHT COLOUR");
			err = 1;
			end
		
		forever begin
			#(2*CLK_PERIOD)
			rgb_prev = rgb;
			colour = colour + 1;		
		end
	end

	initial begin
		#(CLK_PERIOD*4)
		#(CLK_PERIOD*3/4)
		forever begin

			if (enable) begin
				#(CLK_PERIOD*2)
				if (rgb == rgb_prev) begin
					$display("TEST FAILED - COLOUR HAS NOT CHANGED");
					err = 1;
				end
			end
		end
	end

	//finish test
	initial begin
		#300
		if (err==0)
			$display("TEST PASSED");
		$finish;
	end

	colcon top (
		.clk(clk),
		.enable(enable),
		.colour(colour),		
		.rgb(rgb)
	);
	
endmodule

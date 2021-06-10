//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name: Benjamin Sidebotham
// Date: 10/06/21
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb (
	);

	parameter CLK_PERIOD = 10;

	reg clk;
	reg sel;
	reg rst;
	reg button;
	wire [23:0] light;

	reg err;
	
	initial begin
		clk = 1'b0;
		forever
			#(CLK_PERIOD/2) clk=~clk;
	end

	initial begin
		err = 0;
		sel = 0;
		rst = 1;
		button = 1;
		#(CLK_PERIOD)

		// test white light (sel==0)
		if (light != 24'hFFFFFF) begin
			$display("TEST FAILED - sel 0 did not output white");
			err = 1;
		end
		// test rgb when rst == 1 
		sel = 1;
		button = 0;
		#CLK_PERIOD
		if (light != 24'd0) begin
			$display("TEST FAILED - sel 1 rst 1 did not output 0");
			err = 1;
		end
		
		// button ON, cycle colours
		rst = 0;
		forever begin
			button = 1;
			#(CLK_PERIOD*2)
			button = 0;
			#(CLK_PERIOD);
			if (light != 24'h00FF00) begin
				$display("TEST FAILED h00FF00");
				err = 1;
			end
			#CLK_PERIOD

			button = 1;
			#(CLK_PERIOD*2)
			button = 0;
			#(CLK_PERIOD);
			if (light != 24'h00FFFF) begin
				$display("TEST FAILED h00FFFF");
				err = 1;
			end
			#CLK_PERIOD

			button = 1;
			#(CLK_PERIOD*2)
			button = 0;
			#(CLK_PERIOD);
			if (light != 24'hFF0000) begin
				$display("TEST FAILED hFF0000");
				err = 1;
			end
			#CLK_PERIOD

			button = 1;
			#(CLK_PERIOD*2)
			button = 0;
			#(CLK_PERIOD);
			if (light != 24'hFF00FF) begin
				$display("TEST FAILED hFF00FF");
				err = 1;
			end
			#CLK_PERIOD

			button = 1;
			#(CLK_PERIOD*2)
			button = 0;
			#(CLK_PERIOD);
			if (light != 24'hFFFF00) begin
				$display("TEST FAILED hFFFF00");
				err = 1;
			end
			#CLK_PERIOD

			button = 1;
			#(CLK_PERIOD*2)
			button = 0;
			#(CLK_PERIOD);
			if (light != 24'h0000FF) begin
				$display("TEST FAILED h0000FF");
				err = 1;
			end
			#CLK_PERIOD;
			
		end
	end

	initial begin
		#400
		if (err==0)
			$display("TEST PASSED!");
		$finish;
	end

	selector selector_0 (
		.clk(clk),
		.sel(sel),
		.rst(rst),
		.button(button),
		.light(light)
	);

endmodule

//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name: Benjamin Sidebotham
// Date: 08/06/21
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb (
	);

	parameter CLK_PERIOD = 10;

	reg clk;
	reg rst;
	reg button;
	wire [2:0] colour;

	reg err;
	reg [2:0] colour_prev;
	
	//Clock generation
	initial begin
		clk = 1'b0;
		forever 
		#(CLK_PERIOD/2) clk=~clk;
	end

	//Toggle button forever
	initial begin
		button = 0;
		#(CLK_PERIOD*2);
		button = 1;
		forever
			#(CLK_PERIOD) button=~button;					
	end
	
	initial begin
		
		err=0;
		rst=0;
		#CLK_PERIOD;
		rst=1;
		#(CLK_PERIOD/2);
		rst=0;
		#(CLK_PERIOD/2);
		colour_prev = colour;	
		
		forever begin
			
			// state should stay unchanged if button==0
			colour_prev = colour;
			#(CLK_PERIOD);
			if (button==0 && colour!=colour_prev)
				begin
				$display("TEST FAILED - colour changed when button is 0");
				err = 1;
				end

			// test all six colours
			#CLK_PERIOD			
			case(colour_prev)
				3'b001: if (colour != 3'b010) begin
					$display("TEST FAILED - 001 -> 010");
					err = 1;
					end
				3'b010: if (colour != 3'b011) begin
					$display("TEST FAILED - 010 -> 011");
					err = 1;
					end
				3'b011: if (colour != 3'b100) begin
					$display("TEST FAILED - 011 -> 100");
					err = 1;
					end
				3'b100: if (colour != 3'b101) begin
					$display("TEST FAILED - 100 -> 101");
					err = 1;
					end
				3'b101: if (colour != 3'b110) begin
					$display("TEST FAILED - 101 -> 110");
					err = 1;
					end
				3'b110: if (colour != 3'b001) begin
					$display("TEST FAILED - 110 -> 001");
					err = 1;
					end
			endcase
			colour_prev = colour;
		end
	end

	//Finish test, check for success	
     	initial begin
        	#200;
        	if (err==0)
          		$display("***TEST PASSED***");
       	 	$finish;
      	end

	//Instantiate counter module
	led top (
		.clk(clk),
		.rst(rst),
		.button(button),
		.colour(colour)
	);

endmodule

//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name: Benjamin Sidebotham
// Date: 07/06/21
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
	parameter CLK_PERIOD = 10;

	reg clk;
	reg rst;
	reg change;
	reg on_off;
	wire [7:0]counter_out;
	reg [7:0]counter_out_prev;
	reg err;

	//Clock generation
	initial begin
       		clk = 1'b0;
       		forever
         	#(CLK_PERIOD/2) clk=~clk;
     	end

//Todo: User logic
	initial begin
		// Start with inputs as shown on p9 of testbench slides
		rst = 1;
		on_off = 1;
		change = 0;
		err = 0;
		
		
		//check clock
		//#3
		//rst = 1;

		forever begin
			#(CLK_PERIOD)
			counter_out_prev = counter_out;
			if(counter_out != 0)
			begin
				$display("***TEST FAILED - counter not 0 when rst=1");
				err=1;
			end
			counter_out_prev = counter_out;
			rst=0;
			#(CLK_PERIOD)
			if(counter_out != counter_out_prev)
			begin
				$display("***TEST FAILED - counter should not have changed");
				err=1;
			end
			counter_out_prev = counter_out;
			change = 1;
			#(CLK_PERIOD)
			if (counter_out != counter_out_prev + 1)
			begin
				$display("***TEST FAILED - did not increment counter");
				err=1;
			end
			counter_out_prev = counter_out;
			on_off = 0;
			#(CLK_PERIOD)
			if(counter_out != counter_out_prev - 1)
			begin
				$display("***TEST FAILED - did not decrement counter");
				err=1;
			end
		end
	end			
			
    
	//Finish test, check for success	
     	initial begin
        	#50 
        	if (err==0)
          		$display("***TEST PASSED***");
       	 	$finish;
      	end

//Todo: Instantiate counter module
	monitor top (
		.clk (clk),
		.rst (rst),
		.change (change),
		.on_off (on_off),
		.counter_out (counter_out)
		);
 
endmodule 

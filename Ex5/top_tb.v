//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name: Benjamin Sidebotham
// Date: 08/06/21
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
	parameter CLK_PERIOD = 10;

	reg clk;
	reg [4:0] temp;
	wire heating;
	wire cooling;

	reg err = 0;
	reg dir = 1;
	
	initial begin   	
	   clk = 1'b0;
	   forever
		#(CLK_PERIOD/2) clk=~clk;
	end

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
	
	aircon top (
	.temp(temp),
	.clk(clk),
	.heating(heating),
	.cooling(cooling)
	);

endmodule

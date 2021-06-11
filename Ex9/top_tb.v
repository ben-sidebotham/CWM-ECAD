//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #9  - Smart Home Control Unit (Bonus)
// Student Name: Benjamin Sidebotham
// Date: 11/06/21
//
// Description: A testbench module to test Ex9
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb (
	);
    
	parameter CLK_PERIOD = 10;

	reg clk_p;
	wire clk_n;
	reg rst_n;
	reg [4:0] temp; // aircon
	wire heating;
	wire cooling;

	reg [23:0] light; //selector
	reg button;
	reg sel;

	reg a; //blinds
	reg b;
	reg [3:0] func;
	wire roller_out;


	reg err = 0;
	reg dir = 1;
	
	// Clock 
	initial begin   	
		clk_p = 1'b0;
		forever
		#(CLK_PERIOD/2) clk_p=~clk_p;
	end
	assign clk_n=~clk_p;

/////// TESTBENCH AIRCON SYSTEM ///////////////////////////////////////////////////////////////

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
	
//////// TESTBENCH BLINDS /////////////////////////////////////////////////////////////////

	// todo

//////// TESTBENCH LIGHT SELECTOR //////////////////////////////////////////////////////////////
	
	// TODO
	
		
	// finish test
	initial begin
		#500
		if (err==0)
			$display("TEST PASSED");
		$finish;
	end	
	
	// Todo: add ports
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
	.cooling(cooling),

	.button(button),
	.sel(sel),
	.light_0(light[0]),.light_1(light[1]),.light_2(light[2]),.light_3(light[3]),.light_4(light[4]),.light_5(light[5]),.light_6(light[6]),.light_7(light[7]), 
	.light_8(light[8]),.light_9(light[9]),.light_10(light[10]),.light_11(light[11]),.light_12(light[12]),.light_13(light[13]),.light_14(light[14]),.light_15(light[15]),
	.light_16(light[16]),.light_17(light[17]),.light_18(light[18]),.light_19(light[19]),.light_20(light[20]),.light_21(light[21]),.light_22(light[22]),.light_23(light[23])
	
	.a(a),
	.b(b),
	.func_0(func[0]),
	.func_1(func[1]),
	.func_2(func[2]),
	.func_3(func[3]),
	.roller_our(roller_out)
	 
	);

endmodule

	

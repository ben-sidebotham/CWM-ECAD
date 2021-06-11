//////////////////////////////////////////////////////////////////////////////////
// Exercise #9  -  Smart Home Control Unit (Bonus)
// Student Name: Benjamin Sidebotham
// Date: 11/06/21
//
//  Description:  The goal of this exercise is to develop a simple Smart Home control box. This
//  control unit can use all the modules designed in previous exercises, or
//  implement new and exciting functionality. 
//
//	Plan:
//	I want to add the light selector and electric roller blinds to the design from Ex8.
//	Copy modules from prev exercises
//	Copy mem.coe
//	Add IP lines to project.tcl
//	Add ports to top.v
//	Add modules to project.tcl
//
//  inputs:
//           rst_n, clk_n, clk_p, temperature [4:0], 
//  	     button, func [3:0], a, b
//
//  outputs:
//           heating, cooling, roller_out
//////////////////////////////////////////////////////////////////////////////////


module top(
	// Ports for aircon
    input clk_p,
    input clk_n,
	input rst_n,
	input temperature_0,
	input temperature_1,
	input temperature_2,
	input temperature_3,
	input temperature_4,
	output heating,
	output cooling

	// Todo: add ports for light selector
	input button,

	// Todo: add ports for roller blinds
	input a,
	input b,
	input func_0,
	input func_1,
	input func_2,
	input func_3,
	output roller_out


	);

   /* clock infrastructure, do not modify */
	wire clk_ibufds;

    IBUFDS IBUFDS_sysclk (
	.I(clk_p),
	.IB(clk_n),
	.O(clk_ibufds)
	);

     wire clk; //use this signal as a clock for your design
        
     BUFG bufg_clk (
	.I  (clk_ibufds),
	.O  (clk)
      );

	//Add logic here
	aircon aircon_0 (
		.clk(clk),
		.temp({temperature_4,temperature_3,temperature_2,temperature_1,temperature_0}),
		.heating(heating),
		.cooling(cooling)
	);	

endmodule

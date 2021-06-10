//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name: Benjamin Sidebotham
// Date: 10/06/21
//
//  Modified top.v from Ex 4 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module led (
	input clk,
	input rst,
	input button,
	output reg [2:0] colour

	);
	
	always @(posedge rst or button)
		begin
		if (rst)
			colour = 3'b001;
		else
			case(colour)
				3'b000: colour = 3'b001;
				3'b001: colour = (button==1) ? 3'b010 : 3'b001;
				3'b010: colour = (button==1) ? 3'b011 : 3'b010;
				3'b011: colour = (button==1) ? 3'b100 : 3'b011;
				3'b100: colour = (button==1) ? 3'b101 : 3'b100;
				3'b101: colour = (button==1) ? 3'b110 : 3'b101;
				3'b110: colour = (button==1) ? 3'b001 : 3'b110;
				3'b111: colour = 3'b001;
			endcase
		end

endmodule

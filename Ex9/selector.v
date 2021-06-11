//////////////////////////////////////////////////////////////////////////////////
// Exercise #9 - Lights Selector
// Student Name: Benjamin Sidebotham
// Date: 11/06/21
//
//  Description: In this exercise, you need to implement a selector between RGB 
//  lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  Copied from Ex7
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module selector (
	input clk,
	input sel,
	input rst,
	input button,
	output [23:0] light
	);

	wire [2:0] colour;
	wire [23:0] rgb;

	led led_0 (
		.rst(rst),
		.clk(clk),
		.button(button),
		.colour(colour)
	);

	colcon colcon_0 (
		.clk(clk),
		.enable(!rst),
		.colour(colour),
		.rgb(rgb)
	);

	mux mux_0 (
		.a(24'hFFFFFF),
		.b(rgb),
		.sel(sel),
		.out(light)
	);

endmodule


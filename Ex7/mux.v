//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Slector
// Student Name: Benjamin Sidebotham
// Date: 10/06/21
//
//  Modified version of top.v from Ex2  
//  Changed I/Os from 1 to 24 bit arrays
//  
//
//  sel | out
// -----------------
//   0  | a, white[23:0]
//   1  | b, rgb[23:0]
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mux(
	input [23:0] a,
	input [23:0] b,
	input sel,
	output [23:0] out
	);
    
    // if sel is 1, out = b, else out = a
    // #5 adds a 5 tick time delay

	assign #5 out = sel ? b : a;                
      
endmodule

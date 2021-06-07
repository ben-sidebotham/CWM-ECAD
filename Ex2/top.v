//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 - Doorbell Chime
// Student Name: Benjamin Sidebotham
// Date: 07/06/21
//
//  Description: In this exercise, you need to design a multiplexer that chooses between two sounds, where the  
//  output is delayed by 5 ticks (not clocks!) and acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module doorbell(a,b,sel,out);
	input a,b,sel;
	output out;
    
    // if sel is 1, out = b, else out = a
    // #5 adds a 5 tick time delay

	assign #5 out = sel ? b : a;                
      
endmodule

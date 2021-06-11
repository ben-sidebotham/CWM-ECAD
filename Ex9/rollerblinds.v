//////////////////////////////////////////////////////////////////////////////////
// Exercise #9 - Electric Roller Blinds
// Student Name: Benjamin Sidebotham
// Date: 11/06/21
//
//  Copied from Ex1
//
//  a | b | roller_out
// -----------------
//  0 | 0 | func[0] - Closed
//  0 | 1 | func [1] - Quarter open
//  1 | 0 | func [2] - Half open
//  1 | 1 | func [3] - Fully open
//
//  inputs:
//           a, b, func[3:0]
//
//  outputs:
//           roller_out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module blinds(
    input a,
    input b,
    input [3:0] func,
    output roller_out
    );
    
    wire roller_out;
        
	//add your logic here
	assign roller_out = func[{a,b}];

endmodule

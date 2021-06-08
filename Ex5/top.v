//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name: Benjamin Sidebotham
// Date: 08/06/21
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module aircon (
	input clk,
	input [4:0] temp,
	output reg heating,
	output reg cooling
	);
	// 00: HEATING ON ///// 01: IDLE ///// 10: COOLING ON
	reg [1:0] state = 2'b01;
	
	always @(posedge clk) begin
		case(state)
			2'b00: begin
				if (temp >= 5'b10100) begin //move to idle
					state = 2'b01;
					heating = 0;
					cooling = 0;
				end
				else begin
					state = 2'b00;  //remain at heating on
					heating = 1;
					cooling = 0;
				end
			end
			2'b01: begin
				if (temp <= 5'b10010) begin // move to heating on
					state = 2'b00;
					heating = 1;
					cooling = 0;
				end
				else if (temp >= 5'b10110) begin //move to cooling
					state = 2'b10;
					heating = 0;
					cooling = 1;
				end
				else begin // stay at idle
					state = 2'b01;
					heating = 0;
					cooling = 0;
				end
			end
			2'b10: begin
				if (temp <= 5'b10010) begin //move to idle
					state = 2'b01;
					heating = 0;
					cooling = 0;
				end
				else begin // stay at cooling
					state = 2'b10;
					heating = 0;
					cooling = 1;
				end
			end
		endcase
	end

endmodule

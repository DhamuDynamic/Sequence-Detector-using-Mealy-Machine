// Mealy FSM (Overlapping)
module Mealy(Clk,Rst,Din,Y);
	input Clk,Rst,Din;
	output reg Y;
	reg [1:0] curr_state;
	reg [1:0] nxt_state;
	parameter s0 = 2'b00;
	parameter s1 = 2'b01;
	parameter s2 = 2'b10;
	////////// Sequential Block /////////////
	always @(posedge Clk or posedge Rst)
	begin
		if(Rst)
			begin
				curr_state <= s0;
				Y <= 1'b0;
			end
		else
			curr_state <= nxt_state;
	end
	////////// Combinational Block ///////////
	always @(Din or curr_state)
	begin
		case(curr_state)
			s0 : if(Din)
					begin
						nxt_state = s1;
						Y <= 0;
					end
				else
					begin
						next_state = s0;
						Y <= 0;
					end
			s1 : if(Din)
					begin
						nxt_state = s1;
						Y <= 0;
					end
				else
					begin
						nxt_state = s2;
						Y = 0;
					end
			s2 : if(Din)
					begin
						nxt_state = s1;
						Y = 1;
					end
				else
					begin
						nxt_state = s0;
						Y = 0;
					end
			default : nxt_state = s0;
		endcase
	end
endmodule			

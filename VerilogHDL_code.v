module lab_9(clk, reset, in, out);
input clk, reset, in;
output reg out;
reg [3:0] state;
reg[3:0] next_state;
always @(posedge clk)
	if(reset) 
		state = 4'b0000;
	else
		state = next_state;
always @(in or state)
	case (state)
	4'b0000:
		begin
			if(~in)
				next_state = 4'b0001;
			else 
				next_state = 4'b0000;
		end
			
	4'b0001:
		begin
			if(in)
				next_state = 4'b0010;
			else 
				next_state = 4'b0001;
		end

	4'b0010:
		begin
			if(in)
				next_state = 4'b0011;
			else 
				next_state = 4'b0001;
		end

	4'b0011:
		begin
			if(~in)
				next_state = 4'b0100;
			else 
				next_state = 4'b0001;
		end

	4'b0100:
		begin
			if(in)
				next_state = 4'b0101;
			else 
				next_state = 4'b0001;
		end

	4'b0101:
		begin
			if(~in)
				next_state = 4'b0110;
			else 
				next_state = 4'b0011;
		end

	4'b0110:
		begin
			if(in)
				next_state = 4'b0111;
			else 
				next_state = 4'b0001;
		end

	4'b0111:
		begin
			if(in)
				next_state = 4'b1000;
			else 
				next_state = 4'b0001;
		end

	4'b1000:
		begin
			if(~in)
				next_state = 4'b1001;
			else 
				next_state = 4'b0000;
		end

	4'b1001:
		begin
			if(in)
				next_state = 4'b0000;
			else 
				next_state = 4'b0001;
		end

endcase
always @(state)
case(state)
	4'b0000: out=0;
	4'b0001: out=0;
	4'b0010: out=0;
	4'b0011: out=0;
	4'b0100: out=0;
	4'b0101: out=0;
	4'b0110: out=0;
	4'b0111: out=0;
	4'b1000: out=0;
	4'b1001: out=1;
endcase
endmodule
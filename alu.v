
module alu(input [7:0]a,b,
           input [3:0]command_in,
	   input oe,
	   output [15:0]d_out);

   parameter 	
   		 ADD  = 4'b0000,
		 INC  = 4'b0001, 
		 SUB  = 4'b0010,
		 DEC  = 4'b0011,
		 MUL  = 4'b0100, 
		 DIV  = 4'b0101,
		 SHL  = 4'b0110, 
		 SHR  = 4'b0111,
		 AND  = 4'b1000, 
	     OR   = 4'b1001, 
		 INV  = 4'b1010, 
		 NAND = 4'b1011, 
		 NOR  = 4'b1100,
		 XOR  = 4'b1101,
		 XNOR = 4'b1110, 
		 BUF  = 4'b1111;
   //Internal  : out = a|b; variable used during ALU operation
   reg  [15:0]out;
	always @(command_in,a,b) 
	begin
   /*Step1 : Write down the functionality of ALU based on the commands given above.
	        *Use arithmetic and logic */
            //--------- write the functionality here -------  //
		case (command_in)
			ADD 	: out = a+b;
			INC 	: out = a+1;
			SUB 	: out = a-b;
			DEC	    : out = a-1;
			MUL 	: out = a*b;
			DIV 	: out = a/b;
			SHL 	: out = a<<b;
			SHR 	: out = a>>b;
			AND 	: out = a&&b;
			OR  	: out = a||b;
			INV 	: out = ~a;
			NAND	: out = ~(a&&b);
			NOR 	: out = ~(a|b);
			XOR 	: out = a^b;
			XNOR 	: out = ~(a^b);
			BUF 	: out = a;


	 	endcase
    end

   //Understand the tri-state logic for actual output
   assign d_out = (oe) ? out : 16'hzzzz;
		
endmodule

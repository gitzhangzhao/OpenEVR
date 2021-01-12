// Module Function
 
module freq_divider ( 
        input 	              clk,
        input           	  rst,
		  input  wire  [31:0]  divide_data,
        output wire	        clkout
		);
 
   reg  [31:0]  divide_data_reg;
	reg  [31:0]  divider_counter;
   reg          r_clkout;
	
	always @ (posedge clk)                                             
		begin
			if(rst)
			  begin
			      divide_data_reg  <= divide_data;
			      divider_counter  <= 0;
				   r_clkout         <= 0;
			   end
			else
   			if (divide_data_reg == 32'h00000000 || divide_data_reg == 32'h00000001)
			      begin
					   divide_data_reg <= divide_data;
						r_clkout        <= 0;
					end
			   else
				   if (divider_counter == {1'b0,divide_data_reg[31:1]} - 1)
			         begin
			            r_clkout        <= 0;
				         divider_counter <= divider_counter + 1;
				      end
			      else if (divider_counter == divide_data_reg - 1)
			         begin
			            divide_data_reg <= divide_data;
							r_clkout        <= 1;
                     divider_counter <= 0;
                  end						
               else				  
			         divider_counter <= divider_counter + 1;
		end
   
	assign  clkout = (divide_data_reg == 32'h00000000 || divide_data_reg == 32'h00000001) ? clk : r_clkout;
	
endmodule     
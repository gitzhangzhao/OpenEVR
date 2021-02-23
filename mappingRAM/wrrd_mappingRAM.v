/*******************************************************************************
 *
*******************************************************************************/

`timescale 1ns/1ps

module wrrd_mappingRAM(
   input   wire        clk_i,
	//control signals
	input   wire        RAMenable,//bit9,MAPEN
	input   wire        RAMselect_eventcode, //bit8,MAPRS
	input   wire        RAMclear,//bit7,NFRAM
   input   wire        RAMselect_vme,//bit6,VMERS
   input   wire        wraddr_autoi,//bit5,AUTOI,not used
	input   wire        wraddr_reset,//bit4,RSADR
	
	input   wire [7:0]  wraddr,
	input   wire [15:0] wrdata,
	input   wire [18:2] addr_dma1,
	input   wire        write_int,
	input   wire        dtack, //vme信号，代表数据总线上的数据稳定了
	
	input   wire [7:0]  rdaddr,
	output  reg  [15:0] RAMout,
   output  reg         RAMclear_ready
	
);

reg         RAM1wr_en;
reg         RAM2wr_en;
reg         RAM1rd_en;
reg         RAM2rd_en;
reg         reg_int;
reg         RAMvme_wr;
wire [15:0] RAMout1;
wire [15:0] RAMout2;

reg         RAMclear_start;
reg  [1:0]  RAMclear_state;
reg  [7:0]  RAMclear_addr;
wire [15:0] RAMclear_data;
reg         RAMclear_en;
reg         RAMclear_wr;

reg         RAM_wr;
reg  [7:0]  RAM_addr;
reg  [15:0] RAM_data;

//---------mappingRAM clear----------//

   assign RAMclear_data   = 8'b00000000;
   
   always @ (posedge clk_i)
	  begin
	    if (RAMclear == 1'b0)
		   begin
		      RAMclear_state <= 2'b00;
			   RAMclear_addr  <= 8'b00000000;
				RAMclear_en    <= 1'b0;
				RAMclear_wr    <= 1'b0;
				RAMclear_ready <= 1'b0;
		   end
		 else
		   case (RAMclear_state)
		      2'b00:
               begin
				      RAMclear_state <= 2'b01;
			         RAMclear_addr  <= 8'b00000000;
						RAMclear_en    <= 1'b0;
						RAMclear_wr    <= 1'b0;
						RAMclear_ready <= 1'b0;
				   end				
				2'b01: //RAM enable state
			      begin
		            RAMclear_state <= 2'b10;
			         RAMclear_addr  <= RAMclear_addr;
						RAMclear_en    <= 1'b1;
						RAMclear_wr    <= 1'b0;
						RAMclear_ready <= 1'b0;
		         end
			   2'b10: //RAM write state
			      begin
				      RAMclear_state <= 2'b11;
			         RAMclear_addr  <= RAMclear_addr;
						RAMclear_en    <= 1'b1;
						RAMclear_wr    <= 1'b1;	
						RAMclear_ready <= 1'b0;
				   end
			   2'b11: //RAM address increase state
			      begin
			         if ( RAMclear_addr == 8'b11111111)
						   begin
						      RAMclear_state <= 2'b00;
		                  RAMclear_addr  <= RAMclear_addr;
					         RAMclear_en    <= 1'b1;
					         RAMclear_wr    <= 1'b0;
								RAMclear_ready <= 1'b1;
							end						
						else
						   begin
						      RAMclear_state <= 2'b01;
		                  RAMclear_addr  <= RAMclear_addr + 1;
					         RAMclear_en    <= 1'b1;
					         RAMclear_wr    <= 1'b0;
								RAMclear_ready <= 1'b0;
							end
				   end

				 endcase
			  end

//---------mappingRAM wtire----------//

always @ *
    if (RAMenable == 1'b0)
	    begin
		    RAM1wr_en = 1'b0;
			 RAM2wr_en = 1'b0;
		 end
	 else
	   if (RAMselect_vme == 1'b0)
	      begin
		      RAM1wr_en = 1'b1;
			   RAM2wr_en = 1'b0;
		   end
      else
	      begin
		      RAM1wr_en = 1'b0;
			   RAM2wr_en = 1'b1;
		   end	

always @ *
    if (RAMenable == 1'b0)
	    begin
		    RAM1rd_en = 1'b0;
			 RAM2rd_en = 1'b0;
			 RAMout    = 16'b0000000000000000;
		 end
	 else
	   if (RAMselect_eventcode == 1'b0)
	      begin
		      RAM1rd_en = 1'b1;
			   RAM2rd_en = 1'b0;
				RAMout    = RAMout1;
		   end
      else
	      begin
		      RAM1rd_en = 1'b0;
			   RAM2rd_en = 1'b1;
				RAMout    = RAMout2;
		   end

//to detect rising-edge of the write_int signal, 使其与clk_i同步
always @ ( posedge clk_i )  
	if (addr_dma1 == 17'b00000000000000010 && write_int == 1'b1 && wraddr != 8'b00000000)
	  begin
	     reg_int  <= dtack;	
	     if ( reg_int == 1'b0 && dtack == 1'b1 )
	         RAMvme_wr   <= 1'b1;
	     else
	         RAMvme_wr   <= 1'b0;
     end
	 else
	   RAMvme_wr   <= 1'b0;
		
		
//-------to select 
always @ *
   if ( RAMclear == 1'b1 )
	  begin
	     RAM_wr   = RAMclear_wr;
		  RAM_addr = RAMclear_addr;
	     RAM_data = RAMclear_data;
	  end
	else
	   begin
	     RAM_wr   = RAMvme_wr;
		  RAM_addr = wraddr;
	     RAM_data = wrdata;		
		end


mappingRAM mappingRAM1 (
    .clka   (clk_i), 
    .ena    (RAM1wr_en), 
    .wea    (RAM_wr), 
    .addra  (RAM_addr), 
    .dina   (RAM_data), 
    .clkb   (clk_i), 
    .enb    (RAM1rd_en), 
    .addrb  (rdaddr), 
    .doutb  (RAMout1)
    );
	 


mappingRAM mappingRAM2 (
    .clka   (clk_i), 
    .ena    (RAM2wr_en), 
    .wea    (RAM_wr), 
    .addra  (RAM_addr), 
    .dina   (RAM_data), 
    .clkb   (clk_i), 
    .enb    (RAM2rd_en), 
    .addrb  (rdaddr), 
    .doutb  (RAMout2)
    );


endmodule

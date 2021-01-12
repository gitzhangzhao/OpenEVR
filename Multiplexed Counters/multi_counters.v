

module multi_counters ( 
        input 	             clk,
        input   wire [7:0]  rst,
        output  wire	[7:0]  clkout,
		  input   wire [15:0] prescaler_data,
		  output  wire [31:0] mxc_read_data,
		  //control signals, 21 MuxCountSelect, bit3~bit0, MXHSEL MXSEL2 MXSEL1 MXSEL0
		  input   wire        MXHSEL,
		  input   wire	[2:0]  MXSEL,
		  
		  //write signals
		  input   wire [18:2] addr_dma1_set,
	     input   wire [18:2] addr_dma1,
	     input   wire        write_int,
	     input   wire        dtack //vme信号，代表数据总线上的数据稳定了

		);
	


reg 	[31:0]  divide_data0_reg;
reg 	[31:0]  divide_data1_reg;
reg 	[31:0]  divide_data2_reg;
reg 	[31:0]  divide_data3_reg;
reg 	[31:0]  divide_data4_reg;
reg 	[31:0]  divide_data5_reg;
reg 	[31:0]  divide_data6_reg;
reg 	[31:0]  divide_data7_reg;

reg   [31:0]  mxc_read_data_reg;
reg           reg_int;
reg           divideReg_wr;


//to detect rising-edge of the write_int signal, 使其与clk同步
always @ ( posedge clk )  
	if (addr_dma1 == addr_dma1_set && write_int == 1'b1)
	  begin
	     reg_int  <= dtack;	
	     if ( reg_int == 1'b0 && dtack == 1'b1 )
	         divideReg_wr   <= 1'b1;
	     else
	         divideReg_wr   <= 1'b0;
     end
	 else
	   divideReg_wr   <= 1'b0;

always @ ( posedge clk )  
  if (divideReg_wr == 1'b1)
    if (MXHSEL == 1'b1)
      case (MXSEL)
		  3'b000: divide_data0_reg[31:16] <= prescaler_data;
		  3'b001: divide_data1_reg[31:16] <= prescaler_data;
		  3'b010: divide_data2_reg[31:16] <= prescaler_data;
		  3'b011: divide_data3_reg[31:16] <= prescaler_data;
		  3'b100: divide_data4_reg[31:16] <= prescaler_data;
		  3'b101: divide_data5_reg[31:16] <= prescaler_data;
		  3'b110: divide_data6_reg[31:16] <= prescaler_data;
		  3'b111: divide_data7_reg[31:16] <= prescaler_data;
	   endcase
	 else
      case (MXSEL)
		  3'b000: divide_data0_reg[15:0]  <= prescaler_data;
		  3'b001: divide_data1_reg[15:0]  <= prescaler_data;
		  3'b010: divide_data2_reg[15:0]  <= prescaler_data;
		  3'b011: divide_data3_reg[15:0]  <= prescaler_data;
		  3'b100: divide_data4_reg[15:0]  <= prescaler_data;
		  3'b101: divide_data5_reg[15:0]  <= prescaler_data;
		  3'b110: divide_data6_reg[15:0]  <= prescaler_data;
		  3'b111: divide_data7_reg[15:0]  <= prescaler_data;
	   endcase

//always @ *
//    if (MXHSEL)
//      case (MXSEL)
//		  000: mxc_read_data <= divide_data0_reg[31:16];
//		  001: mxc_read_data <= divide_data1_reg[31:16];
//		  010: mxc_read_data <= divide_data2_reg[31:16];
//		  011: mxc_read_data <= divide_data3_reg[31:16];
//		  100: mxc_read_data <= divide_data4_reg[31:16];
//		  101: mxc_read_data <= divide_data5_reg[31:16];
//		  110: mxc_read_data <= divide_data6_reg[31:16];
//		  111: mxc_read_data <= divide_data7_reg[31:16];
//	   endcase
//	 else
//      case (MXSEL)
//		  000: mxc_read_data <= divide_data0_reg[15:0];
//		  001: mxc_read_data <= divide_data1_reg[15:0];
//		  010: mxc_read_data <= divide_data2_reg[15:0];
//		  011: mxc_read_data <= divide_data3_reg[15:0];
//		  100: mxc_read_data <= divide_data4_reg[15:0];
//		  101: mxc_read_data <= divide_data5_reg[15:0];
//		  110: mxc_read_data <= divide_data6_reg[15:0];
//		  111: mxc_read_data <= divide_data7_reg[15:0];
//	   endcase

always @ *
      case (MXSEL)
		  3'b000: mxc_read_data_reg <= divide_data0_reg;
		  3'b001: mxc_read_data_reg <= divide_data1_reg;
		  3'b010: mxc_read_data_reg <= divide_data2_reg;
		  3'b011: mxc_read_data_reg <= divide_data3_reg;
		  3'b100: mxc_read_data_reg <= divide_data4_reg;
		  3'b101: mxc_read_data_reg <= divide_data5_reg;
		  3'b110: mxc_read_data_reg <= divide_data6_reg;
		  3'b111: mxc_read_data_reg <= divide_data7_reg;
	   endcase

assign mxc_read_data = mxc_read_data_reg;
		
freq_divider multi_counters0 (
    .clk         (clk), 
    .rst         (rst[0]), 
    .divide_data (divide_data0_reg), 
    .clkout      (clkout[0])
    );		

freq_divider multi_counters1 (
    .clk         (clk), 
    .rst         (rst[1]), 
    .divide_data (divide_data1_reg), 
    .clkout      (clkout[1])
    );		
	 

freq_divider multi_counters2 (
    .clk         (clk), 
    .rst         (rst[2]), 
    .divide_data (divide_data2_reg), 
    .clkout      (clkout[2])
    );		

freq_divider multi_counters3 (
    .clk         (clk), 
    .rst         (rst[3]), 
    .divide_data (divide_data3_reg), 
    .clkout      (clkout[3])
    );		

freq_divider multi_counters4 (
    .clk         (clk), 
    .rst         (rst[4]), 
    .divide_data (divide_data4_reg), 
    .clkout      (clkout[4])
    );		

freq_divider multi_counters5 (
    .clk         (clk), 
    .rst         (rst[5]), 
    .divide_data (divide_data5_reg), 
    .clkout      (clkout[5])
    );		

freq_divider multi_counters6 (
    .clk         (clk), 
    .rst         (rst[6]), 
    .divide_data (divide_data6_reg), 
    .clkout      (clkout[6])
    );		

freq_divider multi_counters7 (
    .clk         (clk), 
    .rst         (rst[7]), 
    .divide_data (divide_data7_reg), 
    .clkout      (clkout[7])
    );		
	 
endmodule 
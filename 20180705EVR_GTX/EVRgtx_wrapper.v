///////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version : 1.12
//  \   \         Application : Virtex-6 FPGA GTX Transceiver Wizard
//  /   /         Filename : EVRgtx_wrapper.v
// /___/   /\     
// \   \  /  \ 
//  \___\/\___\
// Authors :  LiuZhi (liuz@ihep.ac.cn)
// Date    :  13/06/2017
// modify  :  05/07/2018
// Version :  v1.0
//
///////////////////////////////////////////////////////////////////////////////



//***************************** Entity Declaration ****************************

module EVRgtx_wrapper  #
(
	 //reference clock select
	 parameter   RX_REFCLKSEL               =   0,
	 parameter   TX_REFCLKSEL               =   0
 )
(
    //Reference clock input
    //input  wire  AD9515_REFCLK0P,//frequency from the signal source
    //input  wire  AD9515_REFCLK0N,
    //input  wire  si544_REFCLK1P,//frequency from the crystal oscillator
    //input  wire  si544_REFCLK1N,
	 //input  wire  ADN2812_REFCLK2P,//frequency from the ADN2812
    //input  wire  ADN2812_REFCLK2N,
	 input  wire  rx_refclk_i,
	//--the clock from crystal
	 output wire	       tx_ref_clk, 	
	 output wire	       rx_rec_clk,
	 
	//--
	output wire	          rx_ref_clk,
	
	//-- the RX port
	 input  wire          RXN_IN,
    input  wire          RXP_IN,
    
    output wire  [15:0]  RX_DATA_o,   
    output wire  [1:0]   RX_CHARISK_o,
	 
	 output wire  [9:0]   rst_time_No,
	 output wire          rx_enc_err_o, //-- encoding error indication
	 output wire	       rx_ready_o
);



//***************************** Wire Declarations *****************************

   // ground and vcc signals
   wire        tied_to_ground_i;
	
	//input clock signals
	wire        tx_refclk_i;
//	wire        rx_refclk_i;
	wire        refclk_i_bufg;
		
   wire        rx_rst;	
	
	//user clocks signals
	wire        tx_outclk_i;
	wire        tx_usrclk2_i;
	wire        rx_recclk_i;
	wire        rx_usrclk2_i;	

   //
	wire [1:0]  rx_disp_err;
	wire [1:0]  rx_code_err;
	
	// sigals connect gtx_bitslide and GTX0
	wire        rx_comma_det;
	wire        rx_byte_is_aligned;
	wire        rx_rst_done;	
	wire        rxpll_lockdet;
	wire        rx_ready;
	wire        rx_slide;
	wire        rx_cdr_rst;

   //--fix the phase signals
	wire            bit_slide_rdy;
	wire    [4:0]   bit_slide_No;
	wire            rst_gtx;
   reg             rst_auto;
	reg     [9:0]   bitslide_count;

	 
//********************************* Main Body of Code**************************

   assign tied_to_ground_i             = 1'b0;


//---------------------Dedicated GTX Reference Clock Inputs ---------------	
	//--the TX clock input
//    IBUFDS_GTXE1 tx_ibufds
//    (
//        .O                              (tx_refclk_i),
//        .ODIV2                          (),
//        .CEB                            (tied_to_ground_i),
//        .I                              (AD9515_REFCLK0P),
//        .IB                             (AD9515_REFCLK0N)
//    );

 
//---------------------------- RX reference clock select ------------------------------		
//      generate 
//	      if(RX_REFCLKSEL == 0)		
//            IBUFDS_GTXE1 RXREFCLKSEL0
//				  (
//                .O     (rx_refclk_i),
//                .ODIV2 (),
//                .CEB   (tied_to_ground_i),
//                .I     (ADN2812_REFCLK2P),
//                .IB    (ADN2812_REFCLK2N)
//               );
//	      else
//            IBUFDS_GTXE1 RXREFCLKSEL1
//				  (
//                .O     (rx_refclk_i),
//                .ODIV2 (),
//                .CEB   (tied_to_ground_i),
//                .I     (si544_REFCLK1P),
//                .IB    (si544_REFCLK1N)
//               );
//      endgenerate


//   assign  rx_ref_clk = rx_refclk_i;
//--------------------------------- User Clocks ---------------------------
  	
	//--double reset clock buffer
//    BUFG refclk_bufg
//    (
//        .I         (tx_refclk_i),
//        .O         (refclk_i_bufg)
//    );

    //assign tx_ref_clk = refclk_i_bufg;
    
    //GTX TX user clock
    //BUFG txoutclk_bufg0_i
    //(
    //    .I         (tx_outclk_i),
    //    .O         (tx_usrclk2_i)
    //);
	 
	 assign tx_ref_clk = tx_outclk_i;

   //GTX RX user clock
    BUFG rxrecclk_buf
    (
        .I         (rx_recclk_i),
        .O         (rx_usrclk2_i)
    );

	assign rx_rec_clk = rx_usrclk2_i;


//------------------------- GTX Instances  -------------------------------
  
  EVR_gtx EVRgtx_inst (
    .LOOPBACK_IN            (3'b000), 
    .RXCHARISK_OUT          (RX_CHARISK_o), 
    .RXDISPERR_OUT          (rx_disp_err), 
    .RXNOTINTABLE_OUT       (rx_code_err), 
    .RXBYTEISALIGNED_OUT    (rx_byte_is_aligned), 
    .RXCOMMADET_OUT         (rx_comma_det), 
    .RXSLIDE_IN             (rx_slide), 
    .RXDATA_OUT             (RX_DATA_o), 
    .RXRECCLK_OUT           (rx_recclk_i), 
    .RXUSRCLK2_IN           (rx_usrclk2_i), 
    .RXCDRRESET_IN          (rx_cdr_rst), 
    .RXN_IN                 (RXN_IN), 
    .RXP_IN                 (RXP_IN), 
    .GTXRXRESET_IN          (rx_rst), 
    .MGTREFCLKRX_IN         ({1'b0,rx_refclk_i}), 
    .PLLRXRESET_IN          (1'b0), 
    .RXPLLLKDET_OUT         (rxpll_lockdet), 
    .RXRESETDONE_OUT        (rx_rst_done), 
    .TXCHARISK_IN           (), 
    .GTXTEST_IN             (), 
    .TXDATA_IN              (), 
    .TXOUTCLK_OUT           (tx_outclk_i), 
    .TXUSRCLK2_IN           (tx_usrclk2_i), 
    .TXRUNDISP_OUT          (), 
    .TXN_OUT                (), 
    .TXP_OUT                (), 
    .TXDLYALIGNDISABLE_IN   (), 
    .TXDLYALIGNMONENB_IN    (), 
    .TXDLYALIGNMONITOR_OUT  (), 
    .TXDLYALIGNRESET_IN     (), 
    .TXENPMAPHASEALIGN_IN   (), 
    .TXPMASETPHASE_IN       (), 
    .GTXTXRESET_IN          (1'b0), 
    .MGTREFCLKTX_IN         ({1'b0,rx_refclk_i}), //({1'b0,tx_refclk_i}), 
    .PLLTXRESET_IN          (1'b0), 
    .TXPLLLKDET_OUT         (), 
    .TXRESETDONE_OUT        ()
    );	
    

 //-------------------------- gtx_bitslide Instances -------------------------------
  assign rx_ready = rx_rst_done & rxpll_lockdet;  
  
  gtx_bitslide rx_bitslide_inst (
    .gtp_rst_i                 (rx_rst), 
    .gtp_rx_clk_i              (rx_usrclk2_i), 
    .gtp_rx_comma_det_i        (rx_comma_det), 
    .gtp_rx_byte_is_aligned_i  (rx_byte_is_aligned), 
    .serdes_ready_i            (rx_ready), 
    .gtp_rx_slide_o            (rx_slide), 
    .gtp_rx_cdr_rst_o          (rx_cdr_rst), 
    .bitslide_o                (bit_slide_No), 
    .synced_o                  (bit_slide_rdy)
    );        

  //-------------------------- gen_rx_outputs -------------------------------
  assign rx_enc_err_o = rx_disp_err[0] || rx_disp_err[1] || rx_code_err[0] || rx_code_err[1];
			   
 //fix the phase of recclk
  always @(posedge rx_usrclk2_i)
    if (bit_slide_rdy == 1'b0)
	    begin
          rst_auto    <= 1'b0;
		 end
    else if (bitslide_count == 10'b1111111111)
	    bitslide_count <= 10'b00000000000;
	 else
       if (bit_slide_No != 5'b00011)
		    begin
             rst_auto       <= 1'b1;
             bitslide_count <= bitslide_count + 1;
          end				
       else
		    begin
             rst_auto       <= 1'b0;	
             bitslide_count <= bitslide_count;
          end				

   assign rx_rst = rst_auto;
	
	assign rst_time_No = bitslide_count;
	
	assign rx_ready_o = rx_rst_done & rxpll_lockdet & bit_slide_rdy & !(rst_auto);
	 
	 
endmodule

    

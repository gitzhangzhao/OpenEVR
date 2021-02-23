////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 1.12
//  \   \         Application : Virtex-6 FPGA GTX Transceiver Wizard 
//  /   /         Filename : GTXa_top.v
// /___/   /\      
// \   \  /  \ 
//  \___\/\___\ 
//
//
//***********************************Entity Declaration************************

module TOP
(
    //Reference clock input
    //input  wire  AD9515_REFCLK0P,//frequency from the signal source
    //input  wire  AD9515_REFCLK0N,
    //input  wire  si544_REFCLK1P,//frequency from the crystal oscillator
    //input  wire  si544_REFCLK1N,
	 input  wire  ADN2812_REFCLK2P,//frequency from the ADN2812
    input  wire  ADN2812_REFCLK2N,
	
	//-- the RX port
	 input  wire          RXN_IN,
    input  wire          RXP_IN,
	    
    output wire  [15:0]  w_RAMout,   
    output wire  [1:0]   RX_CHARISK_o,
	 
	 output wire  [9:0]   rst_time_No,
	 output wire          rx_enc_err_o, //-- encoding error indication
	 output wire	       rx_ready_o,
	 
	 //-- VME signals
	 inout   wire [31:0]  DATA,
	 output  wire         BERR,
	 output  wire         DTACK,
	 input   wire [23:1]  ADDR,
	 input   wire         WRITE2_BAR,
	 input   wire [5:0]   AM_LV,
	 input   wire         IACKIN_BAR,
	 input   wire         IACK_BAR,
	 input   wire [4:0]   GA_LV,
	 input   wire         DS0_BAR,
	 input   wire         DS1_BAR,
	 input   wire         LWORD_BAR,
	 input   wire         SYSRESET_BAR,
	 input   wire         AS_BAR,
	 output  wire         IACKOUT_BAR,
    output  wire         VME_DTACK_OE_o,
    output  wire         VME_DATA_DIR_o,
    output  wire         VME_DATA_OE_N_o,
    output  wire         VME_ADDR_DIR_o,
    output  wire         VME_ADDR_OE_N_o,	
	 
	 output  wire [7:1]   VME_IRQ,
   //VME signals end
	
	output  wire         CLK0OUT,
	output  wire         CLK1OUT,
	
	output  wire         CLK2OUT_n,
	output  wire         CLK2OUT_p,
	output  wire         CLK3OUT_n,
	output  wire         CLK3OUT_p,

	output  wire         CLK4OUT_n,
	output  wire         CLK4OUT_p,
	output  wire         CLK5OUT_n,
	output  wire         CLK5OUT_p,
 
	 output wire s20,
	 output wire s21,
	 output wire s30,
	 output wire s31,
	 output wire s40,
	 output wire s41,



   input   wire         ctrl_sig,
	 
	output  wire         pulse
);

//***************************** Wire Declarations *****************************
   //clock signals
   wire            w_tx_refclk;
   wire            w_event_clk;
	wire            w_rx_refclk;
	wire            rx_refclk;
	
   wire   [15:0]   w_RX_DATA;
	
	wire            w_clkout;
	
	//wire            w_RAMout;
	//----VME signals
wire    [18:2]  addr_dma1;
wire    [31:0]  data_wr; 
wire    [31:0]  data_rd; 
wire            write_int; 
wire            ds_dly_clk; 
wire            board_sel;

wire    [31:0]  w_register00;
wire    [31:0]  w_register01;
wire    [31:0]  w_register02;
wire    [31:0]  w_register03;
wire    [31:0]  w_register04;
wire    [31:0]  w_register05;
wire    [31:0]  w_register06;
wire    [31:0]  w_register07;
wire    [31:0]  w_register08;
wire    [31:0]  w_register09;
wire    [31:0]  w_register10;
wire    [31:0]  w_register11;
wire    [31:0]  w_register12;
wire    [31:0]  w_register13;
wire    [31:0]  w_register14;
wire    [31:0]  w_register15;
wire    [31:0]  w_register16;
wire    [31:0]  w_register17;
wire    [31:0]  w_register18;
wire    [31:0]  w_register19;
wire    [31:0]  w_register20;
wire    [31:0]  w_register21;
wire    [31:0]  w_register22;
wire    [31:0]  w_register23;
wire    [31:0]  w_register24;
wire    [31:0]  w_register25;
wire    [31:0]  w_register26;
wire    [31:0]  w_register27;
wire    [31:0]  w_register28;
wire    [31:0]  w_register29;
wire    [31:0]  w_register30;
wire    [31:0]  w_register31;
wire    [31:0]  w_register32;
wire    [31:0]  w_register33;
wire    [31:0]  w_register34;
wire    [31:0]  w_register35;
wire    [31:0]  w_register36;
wire    [31:0]  w_register37;
wire    [31:0]  w_register38;
wire    [31:0]  w_register39;
wire    [31:0]  w_register40;
wire    [31:0]  w_register41;
wire    [31:0]  w_register42;
wire    [31:0]  w_register43;
wire    [31:0]  w_register44;
wire    [31:0]  w_register45;
wire    [31:0]  w_register46;
wire    [31:0]  w_register47;
wire    [31:0]  w_register48;
wire    [31:0]  w_register49;
wire    [31:0]  w_register50;
wire    [31:0]  w_register51;
wire    [31:0]  w_register52;
wire    [31:0]  w_register53;
wire    [31:0]  w_register54;
wire    [31:0]  w_register55;
wire    [31:0]  w_register56;
wire    [31:0]  w_register57;
wire    [31:0]  w_register58;
wire    [31:0]  w_register59;

wire w_pulse0, w_pulse1, w_pulse2, w_pulse3,
     w_pulse4, w_pulse5, w_pulse6, w_pulse7,
	  w_pulse8, w_pulse9, w_pulse10, w_pulse11,
     w_pulse12, w_pulse13;
	  
wire [13: 0]  w_pulse;

wire [5: 0] w_FrontOut;


//revolution_freq
wire            mmcm_clock1;
wire            mmcm_clock2;

wire            revolution_freq;
wire            revolution_freq1;
wire            revolution_freq2;
wire            mmcm_locked;
reg             reg_clock1;
reg             reg_clock2;

   wire [9:0]  divide_data_reg;
	reg  [9:0]  divider_counter;
   reg  [9:0]  revolution_data;
	wire        revolution_usrclk;
	
wire   [9:0]   revolution_gtx_data;
wire   [9:0]   revolution_gtx_data1;
reg    [8:0]   revolution_gtx_addr;
  
assign s20 = 0;
assign s21 = 0;
assign s30 = 1;
assign s31 = 0;
assign s40 = 0;
assign s41 = 0;

//********************************* Main Body of Code**************************


            IBUFDS_GTXE1 RXREFCLKSEL1
				  (
                .O     (w_rx_refclk),
                .ODIV2 (),
                .CEB   (tied_to_ground_i),
                .I     (ADN2812_REFCLK2P),
                .IB    (ADN2812_REFCLK2N)
               );
  
//---------------------------- The GTX Module ---------------------------
  EVRgtx_wrapper EVR_gtx_inst (
    //.AD9515_REFCLK0P  (AD9515_REFCLK0P), 
    //.AD9515_REFCLK0N  (AD9515_REFCLK0N), 
    //.si544_REFCLK1P   (si544_REFCLK1P), 
    //.si544_REFCLK1N   (si544_REFCLK1N), 
    //.ADN2812_REFCLK2P (ADN2812_REFCLK2P), 
    //.ADN2812_REFCLK2N (ADN2812_REFCLK2N), 
    .rx_refclk_i      (w_rx_refclk),  
	 .tx_ref_clk       (w_tx_refclk), 
    .rx_rec_clk       (w_event_clk), 
	 //.rx_ref_clk       (w_rx_refclk),
    .RXN_IN           (RXN_IN), 
    .RXP_IN           (RXP_IN), 
    .RX_DATA_o        (w_RX_DATA), 
    .RX_CHARISK_o     (RX_CHARISK_o), 
    .rst_time_No      (rst_time_No), 
    .rx_enc_err_o     (rx_enc_err_o), 
    .rx_ready_o       (rx_ready_o)
    );


//---------------------------- The vmesimple Module ---------------------------

assign VME_IRQ = 7'b1111111;

reg    clk_vme;
always @(posedge w_event_clk) 
    clk_vme <= ~clk_vme; 
	 
vmesimple vmesimple_inst (
    .clk_i            (clk_vme), 
    .DATA             (DATA), 
    .BERR             (BERR), 
    .DTACK            (DTACK), 
    .ADDR             (ADDR), 
    .WRITE2_BAR       (WRITE2_BAR), 
    .AM_LV            (AM_LV), 
    .IACKIN_BAR       (IACKIN_BAR), 
    .IACK_BAR         (IACK_BAR), 
    .GA_LV            (GA_LV), 
    .DS0_BAR          (DS0_BAR), 
    .DS1_BAR          (DS1_BAR), 
    .LWORD_BAR        (LWORD_BAR), 
    .SYSRESET_BAR     (SYSRESET_BAR), 
    .AS_BAR           (AS_BAR), 
    .IACKOUT_BAR      (IACKOUT_BAR), 
    .VME_DTACK_OE_o   (VME_DTACK_OE_o), 
    .VME_DATA_DIR_o   (VME_DATA_DIR_o), 
    .VME_DATA_OE_N_o  (VME_DATA_OE_N_o), 
    .VME_ADDR_DIR_o   (VME_ADDR_DIR_o), 
    .VME_ADDR_OE_N_o  (VME_ADDR_OE_N_o), 
    .addr_dma1_o      (addr_dma1),
    .data_wr_o        (data_wr), 
    .data_rd_i        (data_rd), 
    .ds_dly_clk_o     (ds_dly_clk), 
    .board_sel_o      (board_sel)
    );


//---------------------------- The register_set Module ---------------------------
assign  write_int = !WRITE2_BAR;

register_set register_set (
    .addr_dma1              (addr_dma1), 
    .data_wr                (data_wr), 
    .data_rd                (data_rd), 
    .write_int              (write_int), 
    .ds_dly_clk             (ds_dly_clk), 
    .board_sel              (board_sel),
	 

	 //.SeqRAM_setseqSR1_i     (s_SeqRAM_setseqSR1), 
    //.SeqRAM_setseqSR2_i     (s_SeqRAM_setseqSR2), 
    .mxc_read_data          (w_mxc_read_data), 
	 .ACmain_read_data       (w_ACmain_read_data),
    //.delay_rstRDY1          (w_delay_rstRDY1), 
    //.delay_rstRDY2          (w_delay_rstRDY2), 
    //.delay_rstRDY3          (w_delay_rstRDY3), 
	 
	 .register00             (w_register00), 
    .register01             (w_register01), 
    .register02             (w_register02), 
    .register03             (w_register03), 
    .register04             (w_register04), 
    .register05             (w_register05), 
    .register06             (w_register06), 
    .register07             (w_register07), 
    .register08             (w_register08), 
    .register09             (w_register09),
	 .register10             (w_register10), 
    .register11             (w_register11), 
    .register12             (w_register12), 
    .register13             (w_register13), 
    .register14             (w_register14), 
    .register15             (w_register15), 
    .register16             (w_register16), 
    .register17             (w_register17), 
    .register18             (w_register18), 
    .register19             (w_register19), 
    .register20             (w_register20), 
    .register21             (w_register21), 
    .register22             (w_register22), 
    .register23             (w_register23), 
    .register24             (w_register24), 
    .register25             (w_register25), 
    .register26             (w_register26), 
    .register27             (w_register27), 
    .register28             (w_register28), 
    .register29             (w_register29), 
    .register30             (w_register30), 
    .register31             (w_register31),
    .register32             (w_register32),
    .register33             (w_register33),
    .register34             (w_register34),
    .register35             (w_register35),
    .register36             (w_register36),
    .register37             (w_register37),
    .register38             (w_register38),
    .register39             (w_register39),
    .register40             (w_register40),
    .register41             (w_register41),
    .register42             (w_register42),
    .register43             (w_register43),
    .register44             (w_register44),
    .register45             (w_register45),
    .register46             (w_register46),
    .register47             (w_register47), 
    .register48             (w_register48), 
    .register49             (w_register49), 
    .register50             (w_register50), 
    .register51             (w_register51), 
    .register52             (w_register52), 
    .register53             (w_register53), 
    .register54             (w_register54), 
    .register55             (w_register55), 
    .register56             (w_register56), 
    .register57             (w_register57), 
    .register58             (w_register58), 
    .register59             (w_register59)
    );


//---------------------------- The mappingRAM Module ---------------------------
 wrrd_mappingRAM mappingRAM_inst (
    .clk_i                (w_event_clk), 
    .RAMenable            (w_register00[9]), 
    .RAMselect_eventcode  (w_register00[8]), 
    .RAMclear             (w_register00[7]), 
    .RAMselect_vme        (w_register00[6]), 
    .wraddr_autoi         (w_register00[5]), 
    .wraddr_reset         (w_register00[4]), 
    .wraddr               (w_register01[7:0]), 
    .wrdata               (w_register02[15:0]), 
    .addr_dma1            (addr_dma1), 
    .write_int            (write_int), 
    .dtack                (DTACK), 
    .rdaddr               (w_RX_DATA[7:0]), 
    .RAMout               (w_RAMout), 
    .RAMclear_ready       ()//(w_mappingRAM_clear_ready)
    );



// ---------------------------- The output pulses ---------------------------
pulse_set Output_pulses (
    .clk                    (w_event_clk), 
    .start                  (w_RAMout[13:0]), 
    .PulseSelect_reg        (w_register13), 
    .PulseWidth_reg         (w_register15), 
    .PulseDelay_reg         (w_register48), 
    .PulsePolarity_reg      (w_register47), 
    .OutputPulseEnables_reg (w_register03), 
    .pulse0                 (w_pulse0), 
    .pulse1                 (w_pulse1), 
    .pulse2                 (w_pulse2), 
    .pulse3                 (w_pulse3), 
    .pulse4                 (w_pulse4), 
    .pulse5                 (w_pulse5), 
    .pulse6                 (w_pulse6), 
    .pulse7                 (w_pulse7), 
    .pulse8                 (w_pulse8), 
    .pulse9                 (w_pulse9), 
    .pulse10                (w_pulse10), 
    .pulse11                (vpulse11), 
    .pulse12                (w_pulse12), 
    .pulse13                (w_pulse13)
    );


assign w_pulse = {w_pulse13, w_pulse12, w_pulse11, w_pulse10, w_pulse9, w_pulse8, w_pulse7, w_pulse6, w_pulse5, w_pulse4, w_pulse3, w_pulse2, w_pulse1, w_pulse0};

// ---------------------------- The front panel select ---------------------------
FPMap FPMap_out (
    .pulses            (w_pulse), 
    .Databus           (w_RX_DATA[15:8]), 
    .revolution_fre402 (revolution_freq1), 
    .revolution_fre396 (revolution_freq2), 
    .FrontOut          (w_FrontOut), 
    .FPS1              (w_register32[5:0]), 
    .FPS2              (w_register33[5:0]), 
    .FPS3              (w_register34[5:0]), 
    .FPS4              (w_register35[5:0]), 
    .FPS5              (w_register36[5:0]), 
    .FPS6              (w_register37[5:0])
    );


freq_divider revolution_freq201 (
    .clk         (w_tx_refclk), 
    .rst         (1'b0), 
    .divide_data (32'h000000c9),//201 
    .clkout      (revolution_freq1)
    );	

freq_divider revolution_freq198 (
    .clk         (w_tx_refclk), 
    .rst         (1'b0), 
    .divide_data (32'h000000c6), //198
    .clkout      (revolution_freq2)
    );	

assign CLK0OUT = w_FrontOut[0];//J2 bottom
assign CLK1OUT = w_FrontOut[1]; //J2 top

//LEMO J7 bottom
OBUFDS#(
        .IOSTANDARD("DEFAULT")//SpecifytheoutputI/Ostandard
        )
  OBUFDS_inst0(
    .O  (CLK2OUT_p),//Diff_poutput(connectdirectlytotop-levelport)
    .OB (CLK2OUT_n),//Diff_noutput(connectdirectlytotop-levelport)
	 //.I  (r_external_trig)
	 .I  (w_FrontOut[2])//Bufferinput
    );
	 
//LEMO J7 top
OBUFDS#(
        .IOSTANDARD("DEFAULT")//SpecifytheoutputI/Ostandard
        )
  OBUFDS_inst1(
    .O  (CLK3OUT_p),//Diff_poutput(connectdirectlytotop-levelport)
    .OB (CLK3OUT_n),//Diff_noutput(connectdirectlytotop-levelport)
    //.I  (w_RX_DATA[15])//Bufferinput
	 .I  (w_FrontOut[3])//Bufferinput
    );
	 

//LEMO J6 bottom
OBUFDS#(
        .IOSTANDARD("DEFAULT")//SpecifytheoutputI/Ostandard
        )
  OBUFDS_inst3(
    .O  (CLK4OUT_p),//Diff_poutput(connectdirectlytotop-levelport)
    .OB (CLK4OUT_n),//Diff_noutput(connectdirectlytotop-levelport)
	 //.I  (r_external_trig)
	 .I  (w_FrontOut[4])//Bufferinput
    );  
	 
//LEMO J6 top
OBUFDS#(
        .IOSTANDARD("DEFAULT")//SpecifytheoutputI/Ostandard
        )
  OBUFDS_inst2(
    .O  (CLK5OUT_p),//Diff_poutput(connectdirectlytotop-levelport)
    .OB (CLK5OUT_n),//Diff_noutput(connectdirectlytotop-levelport)
    //.I  (w_RX_DATA[15])//Bufferinput
	 .I  (w_FrontOut[5])//Bufferinput
    );
	 

endmodule


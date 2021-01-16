////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 1.12
//  \   \         Application : Virtex-6 FPGA GTX Transceiver Wizard 
//  /   /         Filename : revolution_gtx_top.v
// /___/   /\      
// \   \  /  \ 
//  \___\/\___\ 
//
//
// Module revolution_gtx_top
// Generated by Xilinx Virtex-6 FPGA GTX Transceiver Wizard
// 
// 
// (c) Copyright 2009-2011 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES. 


`timescale 1ns / 1ps
`define DLY #1


//***********************************Entity Declaration************************

module revolution_gtx_top #
(
    parameter EXAMPLE_CONFIG_INDEPENDENT_LANES          =   1,   //configuration for frame gen and check
    parameter EXAMPLE_LANE_WITH_START_CHAR              =   0,    // specifies lane with unique start frame char
    parameter EXAMPLE_WORDS_IN_BRAM                     =   512,  // specifies amount of data in BRAM
    parameter EXAMPLE_SIM_GTXRESET_SPEEDUP              =   1,    // simulation setting for GTX SecureIP model
    parameter EXAMPLE_USE_CHIPSCOPE                     =   1     // Set to 1 to use Chipscope to drive resets
)
(
    input           EVR_rx_refclk_i,
	 input           rx_refclk,
	 input  [9:0]    revolution_data,
    input  wire         RXN_IN,
    input  wire         RXP_IN,
	 output          revolution_usrclk,
    output wire         TXN_OUT,
    output wire         TXP_OUT
);


//************************** Register Declarations ****************************

    reg             gtx0_txresetdone_r;
    reg             gtx0_txresetdone_r2;
    //------------------------ MGT Wrapper Wires ------------------------------
    //________________________________________________________________________
    //________________________________________________________________________
    //GTX0   (X0Y5)

    //----------------- Receive Ports - RX Data Path interface -----------------
    wire            gtx0_rxreset_i;
    //---------------- Transmit Ports - TX Data Path interface -----------------
    wire    [9:0]   gtx0_txdata_i;
    wire            gtx0_txoutclk_i;
    wire            gtx0_txreset_i;
    //------ Transmit Ports - TX Elastic Buffer and Phase Alignment Ports ------
    wire            gtx0_txdlyaligndisable_i;
    wire            gtx0_txdlyalignmonenb_i;
    wire    [7:0]   gtx0_txdlyalignmonitor_i;
    wire            gtx0_txdlyalignreset_i;
    wire            gtx0_txenpmaphasealign_i;
    wire            gtx0_txpmasetphase_i;
    //--------------------- Transmit Ports - TX PLL Ports ----------------------
    wire            gtx0_gtxtxreset_i;
    wire            gtx0_plltxreset_i;
    wire            gtx0_txplllkdet_i;
    wire            gtx0_txresetdone_i;




    //----------------------------- Global Signals -----------------------------
    wire            gtx0_tx_system_reset_c;
    wire            gtx0_rx_system_reset_c;
    wire            gtx0_double_reset_clk_i;
    wire            tied_to_ground_i;
    wire    [63:0]  tied_to_ground_vec_i;
    wire            tied_to_vcc_i;
    wire    [7:0]   tied_to_vcc_vec_i;
    wire            drp_clk_in_i;

    //--------------------------- User Clocks ---------------------------------
    wire            gtx0_txusrclk2_i;


    //--------------------------- Reference Clocks ----------------------------
    
    wire            q0_clk0_refclk_i;
    wire            q0_clk0_refclk_i_bufg;
 

    //----------------------- Sync Module Signals -----------------------------


    wire            gtx0_tx_sync_done_i;
    wire            gtx0_reset_txsync_c;




    wire            gtxtxreset_i;
    wire            gtxrxreset_i;

    wire            user_tx_reset_i;
    wire            user_rx_reset_i;
    wire            tx_vio_clk_i;
    wire            tx_vio_clk_mux_out_i;    
    wire            rx_vio_ila_clk_i;
    wire            rx_vio_ila_clk_mux_out_i;

//**************************** Main Body of Code *******************************


    assign gtx0_txdata_i = revolution_data;
   
    //  Static signal Assigments    
    assign tied_to_ground_i             = 1'b0;
    assign tied_to_ground_vec_i         = 64'h0000000000000000;
    assign tied_to_vcc_i                = 1'b1;
    assign tied_to_vcc_vec_i            = 8'hff;



    //---------------------Dedicated GTX Reference Clock Inputs ---------------
    // The dedicated reference clock inputs you selected in the GUI are implemented using
    // IBUFDS_GTXE1 instances.
    //
    // In the UCF file for this example design, you will see that each of
    // these IBUFDS_GTXE1 instances has been LOCed to a particular set of pins. By LOCing to these
    // locations, we tell the tools to use the dedicated input buffers to the GTX reference
    // clock network, rather than general purpose IOs. To select other pins, consult the 
    // Implementation chapter of UG___, or rerun the wizard.
    //
    // This network is the highest performace (lowest jitter) option for providing clocks
    // to the GTX transceivers.
    


 
    

    BUFG q0_clk0_refclk_bufg_i
    (
        .I                              (EVR_rx_refclk_i),
        .O                              (q0_clk0_refclk_i_bufg)
    );

    //---------------------Clock Input to Double Reset Module------------------
    assign gtx0_double_reset_clk_i = q0_clk0_refclk_i_bufg;

    assign rx_refclk               = q0_clk0_refclk_i_bufg;

    //--------------------------------- User Clocks ---------------------------
    
    // The clock resources in this section were added based on userclk source selections on
    // the Latency, Buffering, and Clocking page of the GUI. A few notes about user clocks:
    // * The userclk and userclk2 for each GTX datapath (TX and RX) must be phase aligned to 
    //   avoid data errors in the fabric interface whenever the datapath is wider than 10 bits
    // * To minimize clock resources, you can share clocks between GTXs. GTXs using the same frequency
    //   or multiples of the same frequency can be accomadated using MMCMs. Use caution when
    //   using RXRECCLK as a clock source, however - these clocks can typically only be shared if all
    //   the channels using the clock are receiving data from TX channels that share a reference clock 
    //   source with each other.

    BUFG txoutclk_bufg0_i
    (
        .I                              (gtx0_txoutclk_i),
        .O                              (gtx0_txusrclk2_i)
    );


   assign revolution_usrclk = gtx0_txusrclk2_i;

    //--------------------------- The GTX Wrapper -----------------------------
    
    // Use the instantiation template in the example directory to add the GTX wrapper to your design.
    // In this example, the wrapper is wired up for basic operation with a frame generator and frame 
    // checker. The GTXs will reset, then attempt to align and transmit data. If channel bonding is 
    // enabled, bonding should occur after alignment.
    
    revolution_gtx #
    (
        .WRAPPER_SIM_GTXRESET_SPEEDUP   (EXAMPLE_SIM_GTXRESET_SPEEDUP)
    )
    revolution_gtx_i
    (

        //_____________________________________________________________________
        //_____________________________________________________________________
        //GTX0  (X0Y5)
        .GTX0_DOUBLE_RESET_CLK_IN       (gtx0_double_reset_clk_i),
        //----------------- Receive Ports - RX Data Path interface -----------------
        .GTX0_RXRESET_IN                (1'b0),
        //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
        .GTX0_RXN_IN                    (RXN_IN),
        .GTX0_RXP_IN                    (RXP_IN),
        //---------------- Transmit Ports - TX Data Path interface -----------------
        .GTX0_TXDATA_IN                 (gtx0_txdata_i),
        .GTX0_TXOUTCLK_OUT              (gtx0_txoutclk_i),
        .GTX0_TXRESET_IN                (gtx0_txreset_i),
        .GTX0_TXUSRCLK2_IN              (gtx0_txusrclk2_i),
        //-------------- Transmit Ports - TX Driver and OOB signaling --------------
        .GTX0_TXN_OUT                   (TXN_OUT),
        .GTX0_TXP_OUT                   (TXP_OUT),
        //------ Transmit Ports - TX Elastic Buffer and Phase Alignment Ports ------
        .GTX0_TXDLYALIGNDISABLE_IN      (gtx0_txdlyaligndisable_i),
        .GTX0_TXDLYALIGNMONENB_IN       (gtx0_txdlyalignmonenb_i),
        .GTX0_TXDLYALIGNMONITOR_OUT     (gtx0_txdlyalignmonitor_i),
        .GTX0_TXDLYALIGNRESET_IN        (gtx0_txdlyalignreset_i),
        .GTX0_TXENPMAPHASEALIGN_IN      (gtx0_txenpmaphasealign_i),
        .GTX0_TXPMASETPHASE_IN          (gtx0_txpmasetphase_i),
        //--------------------- Transmit Ports - TX PLL Ports ----------------------
        .GTX0_GTXTXRESET_IN             (1'b0),
        .GTX0_MGTREFCLKTX_IN            (EVR_rx_refclk_i),
        .GTX0_PLLTXRESET_IN             (1'b0),
        .GTX0_TXPLLLKDET_OUT            (gtx0_txplllkdet_i),
        .GTX0_TXRESETDONE_OUT           (gtx0_txresetdone_i)


    );


    // Hold the TX in reset till the TX user clocks are stable
    assign gtx0_txreset_i = !gtx0_txplllkdet_i;




    //---------------------------- TXSYNC module ------------------------------
    // The TXSYNC module performs phase synchronization for all the active TX datapaths. It
    // waits for the user clocks to be stable, then drives the phase align signals on each
    // GTX. When phase synchronization is complete, it asserts SYNC_DONE
    
    // Include the TX_SYNC module in your own design to perform phase synchronization if
    // your protocol bypasses the TX Buffers
  

    // SIM_TXPMASETPHASE_SPEEDUP is a simulation only attribute and MUST be set to 0 
    // during implementation     
    revolution_gtx_tx_sync #
    (
        .SIM_TXPMASETPHASE_SPEEDUP   (EXAMPLE_SIM_GTXRESET_SPEEDUP)
    )
    gtx0_txsync_i 
    (
        .TXENPMAPHASEALIGN(gtx0_txenpmaphasealign_i),
        .TXPMASETPHASE(gtx0_txpmasetphase_i),
        .TXDLYALIGNDISABLE(gtx0_txdlyaligndisable_i),
        .TXDLYALIGNRESET(gtx0_txdlyalignreset_i),
        .SYNC_DONE(gtx0_tx_sync_done_i),
        .USER_CLK(gtx0_txusrclk2_i),
        .RESET(!gtx0_txresetdone_r2)
    );

    


    //------------------------ User Module Resets -----------------------------
    // All the User Modules i.e. FRAME_GEN, FRAME_CHECK and the sync modules
    // are held in reset till the RESETDONE goes high. 
    // The RESETDONE is registered a couple of times on *USRCLK2 and connected 
    // to the reset of the modules
    
    
    
    always @(posedge gtx0_txusrclk2_i or negedge gtx0_txresetdone_i)

    begin
        if (!gtx0_txresetdone_i)
        begin
            gtx0_txresetdone_r    <=   `DLY 1'b0;
            gtx0_txresetdone_r2   <=   `DLY 1'b0;
        end
        else
        begin
            gtx0_txresetdone_r    <=   `DLY gtx0_txresetdone_i;
            gtx0_txresetdone_r2   <=   `DLY gtx0_txresetdone_r;
        end
    end



endmodule


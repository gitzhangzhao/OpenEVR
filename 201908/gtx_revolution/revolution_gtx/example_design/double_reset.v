///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 1.12
//  \   \         Application : Virtex-6 FPGA GTX Transceiver Wizard
//  /   /         Filename : double_reset.v
// /___/   /\     
// \   \  /  \ 
//  \___\/\___\
//
//
// Module DOUBLE_RESET
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

module DOUBLE_RESET
(
        input   CLK,
        input   PLLLKDET,
        output  GTXTEST_DONE,
        output  GTXTEST_BIT1
);

   reg              plllkdet_sync;
   reg              plllkdet_r;
   reg    [10:0]    reset_dly_ctr;
   reg              reset_dly_done;
   reg    [3:0]     testdone_f;


        always @(posedge CLK)
        begin
          plllkdet_r    <= `DLY PLLLKDET;
          plllkdet_sync <= `DLY plllkdet_r;
        end

        assign GTXTEST_BIT1  = reset_dly_done; 
        assign GTXTEST_DONE  = (reset_dly_ctr == 11'd0)? testdone_f[0] : 1'b0;

        always @(posedge CLK)
        begin
          if (!plllkdet_sync) 
              reset_dly_ctr <= `DLY 11'h7FF;
          else if (reset_dly_ctr != 11'h000)
              reset_dly_ctr <= `DLY reset_dly_ctr - 1'b1;
        end

        always @(posedge CLK)
        begin
           if (!plllkdet_sync) 
              reset_dly_done <= `DLY 1'b0;
           else if (reset_dly_ctr[10] == 1'b0) 
              reset_dly_done <= `DLY reset_dly_ctr[8];
        end

        always @(posedge CLK)
        begin
           if (reset_dly_ctr != 11'd0)
              testdone_f     <= `DLY 4'b1111;
           else
              testdone_f     <= `DLY {1'b0, testdone_f[3:1]};
        end

endmodule

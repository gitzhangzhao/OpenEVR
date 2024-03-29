###############################################################################
##
## (c) Copyright 2009-2011 Xilinx, Inc. All rights reserved.
##
## This file contains confidential and proprietary information
## of Xilinx, Inc. and is protected under U.S. and
## international copyright and other intellectual property
## laws.
##
## DISCLAIMER
## This disclaimer is not a license and does not grant any
## rights to the materials distributed herewith. Except as
## otherwise provided in a valid license issued to you by
## Xilinx, and to the maximum extent permitted by applicable
## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
## WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
## (2) Xilinx shall not be liable (whether in contract or tort,
## including negligence, or under any other theory of
## liability) for any loss or damage of any kind or nature
## related to, arising under or in connection with these
## materials, including for any direct, or any indirect,
## special, incidental, or consequential loss or damage
## (including loss of data, profits, goodwill, or any type of
## loss or damage suffered as a result of any action brought
## by a third party) even if such damage or loss was
## reasonably foreseeable or Xilinx had been advised of the
## possibility of the same.
##
## CRITICAL APPLICATIONS
## Xilinx products are not designed or intended to be fail-
## safe, or for use in any application requiring fail-safe
## performance, such as life-support or safety devices or
## systems, Class III medical devices, nuclear facilities,
## applications related to the deployment of airbags, or any
## other applications that could lead to death, personal
## injury, or severe property or environmental damage
## (individually and collectively, "Critical
## Applications"). Customer assumes the sole risk and
## liability of any use of Xilinx products in Critical
## Applications, subject only to applicable laws and
## regulations governing limitations on product liability.
## 
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
## PART OF THIS FILE AT ALL TIMES.



wcfg new
divider add "Receive Ports - RX Data Path interface"
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/RXRESET_IN
divider add "Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR"
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/RXN_IN
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/RXP_IN
divider add "Transmit Ports - GTX Ports"
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/GTXTEST_IN
divider add "Transmit Ports - TX Data Path interface"
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/TXDATA_IN
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/TXOUTCLK_OUT
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/TXRESET_IN
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/TXUSRCLK2_IN
divider add "Transmit Ports - TX Driver and OOB signaling"
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/TXN_OUT
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/TXP_OUT
divider add "Transmit Ports - TX Elastic Buffer and Phase Alignment Ports"
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/TXDLYALIGNDISABLE_IN
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/TXDLYALIGNMONENB_IN
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/TXDLYALIGNMONITOR_OUT
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/TXDLYALIGNRESET_IN
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/TXENPMAPHASEALIGN_IN
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/TXPMASETPHASE_IN
divider add "Transmit Ports - TX PLL Ports"
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/GTXTXRESET_IN
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/MGTREFCLKTX_IN
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/PLLTXRESET_IN
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/TXPLLLKDET_OUT
wave add /DEMO_TB/revolution_gtx_top_i/revolution_gtx_i/gtx0_revolution_gtx_i/TXRESETDONE_OUT

run 375 us
quit




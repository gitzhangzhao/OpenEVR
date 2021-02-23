///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2018 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 14.4
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : chipscope_icon.v
// /___/   /\     Timestamp  : Mon Sep 10 16:02:01 中国标准时间 2018
// \   \  /  \
//  \___\/\___\
//
// Design Name: Verilog Synthesis Wrapper
///////////////////////////////////////////////////////////////////////////////
// This wrapper is used to integrate with Project Navigator and PlanAhead

`timescale 1ns/1ps

//-------------------------------------------------------------------
//
//  VIO Pro core module declaration
//
//-------------------------------------------------------------------
module chipscope_vio 
  (
    inout [35: 0] CONTROL,
    input [ 0: 0] ASYNC_IN,
	 output[20: 0] ASYNC_OUT
  );
endmodule
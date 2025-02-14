/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // Compute the sum of the first 4 bits and the second 4 bits of ui_in
  wire [3:0] first_half  = ui_in[3:0];
  wire [3:0] second_half = ui_in[7:4];
  wire [4:0] sum = first_half + second_half; // 5-bit to handle carry

  // Assign result to output
  assign uo_out  = {3'b000, sum}; // Output sum in lower 5 bits, upper bits zeroed
  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule

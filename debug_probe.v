`timescale 1ns / 1ps
/*
 * Copyright 2015 Forest Crossman
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

`include "ipcore_dir/mimas_v2_hex_display/display_hex_byte.v"

module debug_probe(
	input CLK_100MHz,
	input [5:0] Switch,
	input [7:0] DPSwitch,
	input [7:0] IO_P6,
	input [7:0] IO_P7,
	output [7:0] IO_P8,
	output [7:0] IO_P9,
	output [7:0] LED,
	output [7:0] SevenSegment,
	output [2:0] SevenSegmentEnable
	);

	wire [7:0] display_byte = IO_P6; // The byte to be displayed
	assign LED = IO_P7;
	assign IO_P8 = {1'b0, 1'b0, Switch};
	assign IO_P9 = DPSwitch;

	display_hex_byte #(
		.refresh_rate(1000),
		.sys_clk_freq(100000000)
	)
	hex_display(
		.clk(CLK_100MHz),
		.hex_byte(display_byte),
		.segments(SevenSegment),
		.segments_enable(SevenSegmentEnable)
	);
endmodule

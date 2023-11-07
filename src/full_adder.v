/*
Author    				: 	Junhan Lv
Email Address         	:    1322069095@qq.com
Filename             	:    code.v
Data                 	:    2023-11-6
Description           	:    full_adder maked by half_adder.
Modification History    	:
Data            Author       Version         Change Description
=======================================================
23/11/6        Junhan Lv    1.0              Original
*/

`include "src/half_adder.v"

module full_adder (
    input  wire in1,
    input  wire in2,
    input  wire cin,

    output wire sum,
    output wire count
);

wire h0_sum;
wire h0_count;
wire h1_count;

half_adder half_adder_inst0
(
    .in1(in1),
    .in2(in2),

    .sum(h0_sum),
    .count(h0_count)
);

half_adder half_adder_inst1
(
    .in1(cin),
    .in2(h0_sum),

    .sum(sum),
    .count(h1_count)
);

assign count = (h0_count|h1_count);

    
endmodule

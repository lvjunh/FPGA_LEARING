/*
Author    				: 	Junhan Lv
Email Address         	:    1322069095@qq.com
Filename             	:    code.v
Data                 	:    2023-11-6
Description           	:    half_adder.
Modification History    	:
Data            Author       Version         Change Description
=======================================================
23/11/6        Junhan Lv    1.0              Original
*/

module half_adder (
    input  wire in1,
    input  wire in2,
    
    output wire  sum,
    output wire  count  
);

assign sum = (in1 == in2) ? 0:1;
assign count = (in1 == 1 && in2 == 1) ? 1:0;

endmodule

/*
Author    				: 	Junhan Lv
Email Address         	:    1322069095@qq.com
Filename             	:    code.v
Data                 	:    2023-11-4
Description           	:     二选一数据选择器.
Modification History    	:
Data            Author       Version         Change Description
=======================================================
23/11/4        Junhan Lv    1.0              Original
*/

module mux2_1 (   
   input  wire [0:0] in1,
   input  wire in2,
   input  wire sel,
   output reg [0:0] outdata
);

always @(sel,in1,in2) begin
   if (sel==1'b1) 
      outdata = 1;
   else
      outdata = 0;

end


endmodule

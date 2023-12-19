/*
Author    				: 	Junhan Lv
Email Address         	:    1322069095@qq.com
Filename             	:    counter.v
Data                 	:    2023-11-9
Description           	:    counter for 4.
Modification History    	:
Data            Author       Version         Change Description
=======================================================
23/11/9        Junhan Lv    1.0              Original
*/

module counter (
    input wire clk,
    input wire rst_n,

    output reg [3:0] cnt // 4位
);
    
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)  // 复位信号
        cnt<=0;
    else 
        cnt<=cnt+1'b1;        
end

endmodule

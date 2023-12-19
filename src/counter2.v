/*
Author    				: 	Junhan Lv
Email Address         	:    1322069095@qq.com
Filename             	:    counter2.v
Data                 	:    2023-11-9
Description           	:    counter for 60.
Modification History    	:
Data            Author       Version         Change Description
=======================================================
23/11/9        Junhan Lv    1.0              Original
*/

module counter (
    input wire clk,
    input wire rst_n,

    output reg [5:0] cnt // 6位
);
    
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)  // 复位信号
        cnt<=0;
    case(cnt)
       6'b111011:cnt<=0;
       default cnt<=cnt+1'b1;
    endcase        
end

endmodule

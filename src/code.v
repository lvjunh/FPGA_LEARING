/*
Author    				: 	Junhan Lv
Email Address         	:    1322069095@qq.com
Filename             	:    code.v
Data                 	:    2023-11-4
Description           	:    WaterLED for 8bit.
Modification History    	:
Data            Author       Version         Change Description
=======================================================
23/11/4        Junhan Lv    1.0              Original
*/

module LED (    
   input  clk,         // 时钟端口
   input  rst_n,        // 复位端口 低电平有效
   output reg [7:0] dataout    // 数据输出端口 8位LED输出
);
   
reg [22:0] cnt;  // 定义一个23位计数器

always @(posedge clk or negedge rst_n) begin    // 在时钟上升沿或者复位下降沿到来时
   if (!rst_n)    
      cnt<=0;
   else
      cnt<=cnt+1'b1;
end

always @(posedge clk or negedge rst_n) begin
   if (!rst_n)
      dataout<=12'b1110_0111;

   else if(cnt==23'h7fffff)begin
      dataout[2:0] <= dataout[3:1];
      dataout[3] <= dataout[0];
      dataout[7:5] <= dataout[6:4];
      dataout[4] <= dataout[7];
   end

   else
      dataout <= dataout;
end
endmodule

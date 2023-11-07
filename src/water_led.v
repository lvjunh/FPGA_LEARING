/*
Author    				: 	Junhan Lv
Email Address         	:    1322069095@qq.com
Filename             	:    water_led.v
Data                 	:    2023-11-7
Description           	:    WaterLED for 8bit.
Modification History    	:
Data            Author       Version         Change Description
=======================================================
23/11/7        Junhan Lv    1.0              Original
*/

/*---------------------一段式状态机----------------------*/

module WaterLED (    
   input  clk,         // clk freq 25Mhz
   input  rst_n,        // reset port low bat
   output reg [7:0] dataout    // 8bit LED data out
);
   
reg [22:0] cnt;  

always @(posedge clk or negedge rst_n) begin
   if (!rst_n)begin
      dataout<=8'b1110_0111;     // reset signal
      cnt<=0;
   end
      
   else if(cnt==23'h2625A0)begin  // 100 ms
      dataout[2:0] <= dataout[3:1];
      dataout[3] <= dataout[0];
      dataout[7:5] <= dataout[6:4];
      dataout[4] <= dataout[7];
   end

   else begin
      cnt<=cnt+1'b1;
      dataout <= dataout;
   end
    
end
endmodule



/*---------------------二段式状态机----------------------*/

/*
module WaterLED (    
   input  clk,         // 时钟端口
   input  rst_n,        // 复位端口 低电平有效
   output reg [7:0] dataout    // 数据输出端口 8位LED输出
);
   
reg [22:0] cnt;  

always @(posedge clk or negedge rst_n) begin    
   if (!rst_n)    
      cnt<=0;
   else
      cnt<=cnt+1'b1;
end

always @(posedge clk or negedge rst_n) begin
   if (!rst_n)
      dataout<=8'b1110_0111;

   else if(cnt==23'h2625A0)begin
      dataout[2:0] <= dataout[3:1];
      dataout[3] <= dataout[0];
      dataout[7:5] <= dataout[6:4];
      dataout[4] <= dataout[7];
   end

   else
      dataout <= dataout;
end
endmodule
*/




/*---------------------三段式状态机----------------------*/
/*

module WaterLED (
   input  clk,         // clock port
   input  rst_n,        // reset port low bat 
   output reg [7:0] dataout    // 8bit data out
);

reg [22:0] cnt;  

always @(posedge clk or negedge rst_n) begin    
   if (!rst_n)    
      cnt<=0;
   else
      cnt<=cnt+1'b1;
end


always @(posedge clk or negedge rst_n) begin
   if (!rst_n) begin
      dataout<=8'b1110_0111;    // reset signal 
   end
   else if(cnt==23'h2625A0)begin
      dataout[2:0] <= dataout[3:1];
      dataout[3] <= dataout[0];
   end
   else
      dataout<=dataout;
end
   
always @(posedge clk or negedge rst_n) begin
   if (!rst_n) begin
      dataout<=8'b1110_0111;    // reset signal 
   end
   else if(cnt==23'h2625A0)begin
      dataout[7:5] <= dataout[6:4];
      dataout[4] <= dataout[7];
   end
   else
      dataout<=dataout;
end
endmodule

*/
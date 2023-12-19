/*
Author    				: 	Junhan Lv
Email Address         	:    1322069095@qq.com
Filename             	:    counter.v
Data                 	:    2023-12-5
Description           	:    breath_led.
Modification History    	:
Data            Author       Version         Change Description
=======================================================
23/12/5        Junhan Lv    1.0              Original
*/


module breath_led          //模块开始，定义名称为waterfall_light
#(
    parameter CNT_1US_MAX = 6'd49   ,  //定义全局变量CNT_1US_MAX，时间周期为1us 
    parameter CNT_1MS_MAX = 10'd999 ,  //定义全局变量CNT_1MS_MAX，时间周期为1ms 
    parameter CNT_1S_MAX  = 10'd999    //定义全局变量CNT_1S_MAX，时间周期为1s 
)
(
    input    wire    sys_clk   ,     //定义sys_clk为输入模式   (时钟)
    input    wire    sys_rst_n ,     //定义sys_rst_n为输入模式 (复位)
    
    output    reg[3:0]        led_out          //定义led_out为寄存器类型的输出模式
);
 
    reg  [5:0]    cnt_1us;           //定义cnt_1us为6位宽的寄存器类型
    reg  [9:0]    cnt_1ms;           //定义cnt_1ms为10位宽的寄存器类型
    reg  [9:0]    cnt_1s ;           //定义cnt_1s为10位宽的寄存器类型
    reg          cnt_en ;           //定义cnt_en为寄存器类型
    
always@(posedge sys_clk or negedge sys_rst_n)
    begin
        if(sys_rst_n == 1'b0)               //复位信号到来
            begin
                cnt_1us <= 6'd0;            //使cnt_1us清零
            end
        else    if(cnt_1us == CNT_1US_MAX)  //判断cnt_1us是否计数到最大值
            begin
                cnt_1us <= 6'd0;            //使cnt_1us清零
            end
        else 
            cnt_1us <= cnt_1us + 6'd1;        //使cnt_1us + 1
    end
    
always@(posedge sys_clk or negedge sys_rst_n)
    begin
        if(sys_rst_n == 1'b0)               //复位信号到来
            begin
                cnt_1ms <= 10'd0;           //使cnt_1ms清零
            end
        else    if((cnt_1ms == CNT_1MS_MAX)&&(cnt_1us == CNT_1US_MAX))  //判断cnt_1us和cnt_1ms是否同时计数到最大值 
            begin
                cnt_1ms <= 10'd0;           //使cnt_1ms清零
            end
        else    if(cnt_1us == CNT_1US_MAX)  //判断cnt_1us是否计数到最大值
            begin
                cnt_1ms <= cnt_1ms + 10'd1;   //使cnt_1ms + 1
            end
        else 
            cnt_1ms <= cnt_1ms;
    end
    
always@(posedge sys_clk or negedge sys_rst_n)
    begin
        if(sys_rst_n == 1'b0)               //复位信号到来
            begin
                cnt_1s <= 10'd0;           //使cnt_1s清零
            end
        else    if((cnt_1s  == CNT_1S_MAX)&& (cnt_1ms == CNT_1MS_MAX)&&(cnt_1us == CNT_1US_MAX))  //判断cnt_1us,cnt_1ms,cnt_1s是否同时计数到最大值 
            begin
                cnt_1s <= 10'd0;           //使cnt_1s清零
            end
        else    if((cnt_1ms == CNT_1MS_MAX)&&(cnt_1us == CNT_1US_MAX))  //判断cnt_1us和cnt_1ms是否同时计数到最大值 
            begin
                cnt_1s <= cnt_1s + 10'd1;  //使cnt_1s + 1
            end
        else 
            cnt_1s <= cnt_1s;              //使cnt_1s保持不变
    end
 
always@(posedge sys_clk or negedge sys_rst_n)
    begin
        if(sys_rst_n == 1'b0)              //复位信号到来
            begin
                cnt_en <= 1'b0;            //使cnt_1s清零
            end
        else    if((cnt_1s  == CNT_1S_MAX)&& (cnt_1ms == CNT_1MS_MAX)&&(cnt_1us == CNT_1US_MAX))  //判断cnt_1us,cnt_1ms,cnt_1s是否同时计数到最大值 
            begin
                cnt_en <= ~cnt_en;         //使cnt_en取反
            end
        else 
            cnt_en <= cnt_en;              //使cnt_en保持不变    
    end
 
always@(posedge sys_clk or negedge sys_rst_n)
    begin
        if(sys_rst_n == 4'b0000)              //复位信号到来
            begin
                led_out <= 4'b1111;            //使led_out置1
            end
        else    if(((cnt_en  == 1'b0)&&(cnt_1ms <= cnt_1s)) || ((cnt_en  == 1'b1)&&(cnt_1ms > cnt_1s))) //判断cnt_en为0且cnt_1ms计数值小于等于cnt_1s
            begin                                                                                       //或者判断cnt_en为1且cnt_1ms计数值大于cnt_1s执行
                led_out <= 4'b0000;            //使led_out置0
            end
        else 
            led_out <= 4'b1111;                //使led_out置1
    end
    
endmodule         //模块结束





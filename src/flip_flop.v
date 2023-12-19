`timescale 1us/1us
module flip_flop (
    input  wire sys_clk,
    input  wire sys_rst_n,
    input  wire key_in,

    output reg led_out
);

always @(posedge sys_clk) begin  // 异步复位
    if (sys_rst_n == 1'b0) begin    // 复位信号 低电平有效
        led_out<=1'b0;  
    end
    else
        led_out<=key_in;
end
endmodule



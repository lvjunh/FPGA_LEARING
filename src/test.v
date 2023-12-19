`timescale 1ns/1ns
module multi_sel(
input [7:0]d ,
input clk,
input rst,
output reg input_grant,
output reg [10:0]out
);
reg [1:0] cnt;

//*************code***********//
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        input_grant <=0;
        out <= 0;
        cnt <=0; 
    end
    else begin
        case(cnt)
            0:begin
                out<=d;
                input_grant<=1;
            end
            1:begin
                out <= d<<2-d;
                input_grant <= 0;
            end
            2:begin
                out <= d<<3-d;
                input_grant<=0;
            end
            3:begin
                out <= d<<3;
                input_grant <= 0;
            end
        endcase
    end
end

//*************code***********//
endmodule
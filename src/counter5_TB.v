/*
Author    				: 	Junhan Lv
Email Address         	:    1322069095@qq.com
Filename             	:    counter.v
Data                 	:    2023-12-5
Description           	:    counter for 4 test.
Modification History    	:
Data            Author       Version         Change Description
=======================================================
23/12/5        Junhan Lv    1.0              Original
*/


`timescale 1ns/1ns
module counter5_TB;

reg	clk;  
reg	rst_n;
localparam PERIOD = 20;	//50MHz
initial	
begin
	clk = 0;
	forever	#(PERIOD/2)	
	clk = ~clk;
end

task task_reset;
begin
	rst_n = 0;
	repeat(2) @(negedge clk);
	rst_n = 1;
end
endtask


wire	[3:0]	cnt;
counter	u_Counter_Design
(
	//globol clock
	.clk	(clk),
	.rst_n	(rst_n),
	
	//led interface
	.cnt	(cnt)
);


task task_sysinit;
begin
end
endtask


initial
begin
	task_sysinit;
	task_reset;
end

endmodule
一名词解释:

1、ISP:     在线系统可编程技术
2、LE:      可编程逻辑单元
3、HPS:     硬件处理系统,包括与AVM相接的硬件接口
4、Die:     芯片未进行封装前的晶粒，从硅晶圆上切割而下的小片
5、OpenCL:  开放运算语言,是第一个面向导构系统通用目的并行编程的开放式的编程环境
6、GPU:     图形处理器
7、PLL:     锁相环,用来统一整合时钟信号
8、DUT:     待测模块
9、HLL:     计算机高级语言
10、SPI:    串行外设接口,一种高速全双工,同步的通信总线协议
11、UART:   通用异步传输收发器
12、IIC:    双向二线制串行总线
13、FPGA:   现场可编程门阵列
14、DSP:    数字信号处理器
15、ASIC:   专用集成电路
16、CPLD:   复杂可编程逻辑器件
17、SoC(System on Chip):        片上系统
18、FIFO(first in first out):   先进先出数据缓存器
19、DRAM:   动态随机存储器
20、SRAM:   静态随机存储器
21、SDRAM:  同步动态随机存储器
22、HDL:    硬件描述语言
23、VHDL:   高速集成电路的硬件描述语言

二:
Input_Voltage = 5V;
Output_Voltage = 2.5V;
External_Environment_temperature = 50;
Max_junction_temperature = 150;
Pd(功率) = (External_Environment_temperature-Max_junction_temperature)/136;
Pd = I_max(Input_Voltage-Output_Voltage);
I_max = Pd/(Input_Voltage-Output_Voltage);


三:

Input_Voltage=5V;
Output_Voltage1=3.3V;
Output_Voltage2=1.2V;


四:Example as EPM240T100C5N,Explain the FPGA/CPLD core circuit requirements analysis and design process
1.      下载并阅读元器件手册
2.      计算确定IC工作电压
3.      计算功耗选择电源
4.      规划IC时钟网络分布
5.      规划下载电路的设计
6.      考虑器件工作的最高主频
7.      考虑IO口资源的设计

五:Briefly describe the 6 process steps for project software development based on FPGA/CPLD?
1.      明确设计来源(idea)
2.      通过Verilog HDL或原理图、IP核等方式进行电路设计
3.      利用Quartus II进行电路综合
4.      利用Quartus II进行逻辑电路的布局布线
5.      使用第三方软件(modelsim等)进行仿真测试，逻辑验证等
6.      固化FPGA/CPLD

六:Briefly describe the feature of SPI
1.      可以同时发送和接受串行数据
2.      可以当作主机或从机使用
3.      提供频率可编程时钟
4.      发送结束中断标志
5.      写保护冲突
6.      总线竞争保护

七:Briefly describe two ways of serial communication and Explain the 6 timing requirements of the serial port communication protocol
ways:
1.      同步通信
2.      异步通信
requirements:
1.      
2.      
3.   
4.      
5.      
6.      

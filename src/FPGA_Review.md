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
1. Input_Voltage = 5V; 
2. Output_Voltage = 2.5V; 
3. External_Environment_temperature = 50; 
4. Max_junction_temperature = 150;
5. Pd(功率) = (External_Environment_temperature-Max_junction_temperature)/136; 
6. Pd = I_max(Input_Voltage-Output_Voltage); 
7. I_max = Pd/(Input_Voltage-Output_Voltage); 


三:
Input_Voltage=5V;
Output_Voltage1=3.3V;
Output_Voltage2=1.2V;
![DCDC并行电源模块设计方案.png]
![PLL配置电路.png]
![TPS75003原理图.png]




四:Example as EPM240T100C5N,Explain the FPGA/CPLD core circuit requirements analysis and design process.
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

七:Briefly describe two ways of serial communication and Explain the 6 timing requirements of the serial port communication protocol.
ways:
1.      同步串行通信 
2.      异步串行通信 
requirements:
1.      数据由设备1的TXD向设备2的RXD发送 
2.      数据流在某一波特率下工作，发送期间不能改变 
3.      在空闲状态，数据为高电平 
4.      先发一个0，作为数据发送的起始信号位(设备2响应信号) 
5.      数据由LSB->MSB,即D0->D7发送 
6.      最后发一个1,作为数据发送的结束位信号(数据发送结束) 

八:直接频率合成法通过相位累加原理，实现了通过步长可配置的任意频率波形输出。根据这个原理，通过对相位累加的地址进行处理，可以直接计算得到相应的频率。假定FPGA基准时钟为50Mhz，同时规定计数器的位数N=24，则相位累加后输出的最大频率与最小顿率分别为多少?已知K为频率控制字，f每增加或者减少100Hz，K的步进为多少?
1. CLK = 50M; 
2. N = 24; 
3. CLK_Out = (CLK*K)/2^N;
4. Freq_Max = CLK/2 = 25Mhz 
5. Freq_Min = CLK/2^N(K=1时)
6. K = (CLK_Out*2^N)/CLK
7. step = 2^N/CLK*100


九:Briefly describe the 5 simulation modes and their characteristics.
1.      前仿真:即功能仿真,可使用专用于仿真的工具对设计进行功能仿真，以验证电路功能是否符合设计要求。
               通过功能仿真能够及时发现设计中的错误，从而加快设计进度，提高设计的可靠性

2.      综合后的仿真:把综合生成的标准延时反标注到综合仿真模型去，可估计门延时带来的影响，但是只能估计
                    门延时，不能估计布线延时，仿真结果和实际情况还有一定的差距，并不十分准确。
                    综合后的仿真一般只在IC设计中用到，但由于目前综合工具比较成熟，大多数的软件能胜任
                    综合工作，因此一般省去了此环节的仿真(在本书的基于Quartus II的开发中，没有进行综合后的仿真)

3.      布局布线后的仿真:布局布线后的仿真，即时序仿真。布局布线后生成的仿真延时文件最全，不仅包括门延时，
                        还包括布线延时，因此最为准确，能较好地反映芯片的实际工作情况。一般来讲，布局布线后的仿真必须进行，以确保设计的可靠性和稳定性，并可发现时序违规(Timing Violation)等时序错误，从而进一步对逻辑电路进行优化设计。

4.      板级仿真:在某些高速设计的逻辑电路中，为了保证设计的稳定性与可靠性，还需要使用第三方板级验
                证工具进行仿真与测试，如MentorTau、Forte Design-Timing Designer、Mentor Hyperlynx、Mentor 
                ICX、Cadence SPECCTRAQuest、Synopsys HSPICE。这些工具通过设计IBIS和HSPICE等模型的仿真，能较好地分析高速设计信号的完整性、电磁干扰(EMI)等电路特性

5.      在线仿真:在加载配置目标板之后，设计者在必要情况下要进行的一个步骤就是在线仿真调试，即利用
                Quartus II自带的SignalTap II在线逻辑分析仪进行通信分析，通过JTAG口在线、实时读取FPGA内部
                信号进行在线仿真，分析时序是否正确



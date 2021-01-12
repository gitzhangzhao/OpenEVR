/***************************************************************************************
实现功能简述：本模块主要功能是产生一个确定时钟周期长度（最长为256个时钟周期）的脉冲信号，
可以自己设定脉冲长度，输出的脉冲信号与时钟上升沿同步，脉冲宽度 = pulsewide + 1 时钟周期;

输入一个启动信号后，可以产生一个固定时钟周期长度的脉冲信号，与启动信号的长短无关！脉冲宽度可调！

1、可以调整输出脉冲宽度
2、只要输入一个启动信号，不论启动信号宽度--需要能够触发设计，就输出脉冲
3、在输出一个完整的脉冲过程中，不论输入多少个启动信号，都只会输出一个脉冲
4、不论启动脉冲的宽度多大，输出的脉冲宽度恒定 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
***************************************************************************************/


module pulse_set ( 
    input   wire        clk,
	 
	 input   wire [13:0] start,
	 
	 input   wire [31:0] PulseSelect_reg,  //reg13,0x34
	 input   wire [31:0] PulseWidth_reg,   //reg15,0x3c
	 input   wire [31:0] PulseDelay_reg,   //reg48,0xc0
	 input   wire [31:0] PulsePolarity_reg,//reg47,0xbc,bit11-bit24
	 input   wire [31:0] OutputPulseEnables_reg,//reg03,0x0c,bit0-bit13
	 
    output  wire        pulse0,
    output  wire        pulse1,
    output  wire        pulse2,
    output  wire        pulse3,
    output  wire        pulse4,
    output  wire        pulse5,
    output  wire        pulse6,
    output  wire        pulse7,
    output  wire        pulse8,
    output  wire        pulse9,
    output  wire        pulse10,
    output  wire        pulse11,
    output  wire        pulse12,
    output  wire        pulse13
	 	 
	 );

reg  [31:0] pulsedelay0;
reg  [31:0] pulsewide0;

reg  [31:0] pulsedelay1;
reg  [31:0] pulsewide1;

reg  [31:0] pulsedelay2;
reg  [31:0] pulsewide2;

reg  [31:0] pulsedelay3;
reg  [31:0] pulsewide3;

reg  [31:0] pulsedelay4;
reg  [31:0] pulsewide4;

reg  [31:0] pulsedelay5;
reg  [31:0] pulsewide5;

reg  [31:0] pulsedelay6;
reg  [31:0] pulsewide6;

reg  [31:0] pulsedelay7;
reg  [31:0] pulsewide7;

reg  [31:0] pulsedelay8;
reg  [31:0] pulsewide8;

reg  [31:0] pulsedelay9;
reg  [31:0] pulsewide9;

reg  [31:0] pulsedelay10;
reg  [31:0] pulsewide10;

reg  [31:0] pulsedelay11;
reg  [31:0] pulsewide11;

reg  [31:0] pulsedelay12;
reg  [31:0] pulsewide12;

reg  [31:0] pulsedelay13;
reg  [31:0] pulsewide13;


always @ (posedge clk)
   begin
	   case(PulseSelect_reg[4:0])
		   5'b10000:
			   begin
				   pulsedelay0 <= PulseDelay_reg;
               pulsewide0  <= PulseWidth_reg;
				end
			5'b10001:
			   begin
				   pulsedelay1 <= PulseDelay_reg;
               pulsewide1  <= PulseWidth_reg;
				end
			5'b10010:
			   begin
				   pulsedelay2 <= PulseDelay_reg;
               pulsewide2  <= PulseWidth_reg;
				end
			5'b10011:
			   begin
				   pulsedelay3 <= PulseDelay_reg;
               pulsewide3  <= PulseWidth_reg;
				end
			5'b10100:
			   begin
				   pulsedelay4 <= PulseDelay_reg;
               pulsewide4  <= PulseWidth_reg;
				end
			5'b10101:
			   begin
				   pulsedelay5 <= PulseDelay_reg;
               pulsewide5  <= PulseWidth_reg;
				end			
			5'b10110:
			   begin
				   pulsedelay6 <= PulseDelay_reg;
               pulsewide6  <= PulseWidth_reg;
				end		
			5'b10111:
			   begin
				   pulsedelay7 <= PulseDelay_reg;
               pulsewide7  <= PulseWidth_reg;
				end		
			5'b11000:
			   begin
				   pulsedelay8 <= PulseDelay_reg;
               pulsewide8  <= PulseWidth_reg;
				end
			5'b11001:
			   begin
				   pulsedelay9 <= PulseDelay_reg;
               pulsewide9  <= PulseWidth_reg;
				end
			5'b11010:
			   begin
				   pulsedelay10 <= PulseDelay_reg;
               pulsewide10  <= PulseWidth_reg;
				end
			5'b11011:
			   begin
				   pulsedelay11 <= PulseDelay_reg;
               pulsewide11  <= PulseWidth_reg;
				end
			5'b11100:
			   begin
				   pulsedelay12 <= PulseDelay_reg;
               pulsewide12  <= PulseWidth_reg;
				end
			5'b11101:
			   begin
				   pulsedelay13 <= PulseDelay_reg;
               pulsewide13  <= PulseWidth_reg;
				end
			
		   default:;
		endcase
	end


programable_pulse pulse_out0 (
    .clk          (clk), 
    .reset        (OutputPulseEnables_reg[0]), 
    .polarity     (PulsePolarity_reg[11]), 
    .start        (start[0]), 
    .pulsedelay   (pulsedelay0), 
    .pulsewide    (pulsewide0), 
    .pulse        (pulse0)
    );

programable_pulse pulse_out1 (
    .clk          (clk), 
    .reset        (OutputPulseEnables_reg[1]), 
    .polarity     (PulsePolarity_reg[12]), 
    .start        (start[1]), 
    .pulsedelay   (pulsedelay1), 
    .pulsewide    (pulsewide1), 
    .pulse        (pulse1)
    );

programable_pulse pulse_out2 (
    .clk          (clk), 
    .reset        (OutputPulseEnables_reg[2]), 
    .polarity     (PulsePolarity_reg[13]), 
    .start        (start[2]), 
    .pulsedelay   (pulsedelay2), 
    .pulsewide    (pulsewide2), 
    .pulse        (pulse2)
    );

programable_pulse pulse_out3 (
    .clk          (clk), 
    .reset        (OutputPulseEnables_reg[3]), 
    .polarity     (PulsePolarity_reg[14]), 
    .start        (start[3]), 
    .pulsedelay   (pulsedelay3), 
    .pulsewide    (pulsewide3), 
    .pulse        (pulse3)
    );

programable_pulse pulse_out4 (
    .clk          (clk), 
    .reset        (OutputPulseEnables_reg[4]), 
    .polarity     (PulsePolarity_reg[15]), 
    .start        (start[4]), 
    .pulsedelay   (pulsedelay4), 
    .pulsewide    (pulsewide4), 
    .pulse        (pulse4)
    );

programable_pulse pulse_out5 (
    .clk          (clk), 
    .reset        (OutputPulseEnables_reg[5]), 
    .polarity     (PulsePolarity_reg[16]), 
    .start        (start[5]), 
    .pulsedelay   (pulsedelay5), 
    .pulsewide    (pulsewide5), 
    .pulse        (pulse5)
    );

programable_pulse pulse_out6 (
    .clk          (clk), 
    .reset        (OutputPulseEnables_reg[6]), 
    .polarity     (PulsePolarity_reg[17]), 
    .start        (start[6]), 
    .pulsedelay   (pulsedelay6), 
    .pulsewide    (pulsewide6), 
    .pulse        (pulse6)
    );

programable_pulse pulse_out7 (
    .clk          (clk), 
    .reset        (OutputPulseEnables_reg[7]), 
    .polarity     (PulsePolarity_reg[18]), 
    .start        (start[7]), 
    .pulsedelay   (pulsedelay7), 
    .pulsewide    (pulsewide7), 
    .pulse        (pulse7)
    );

programable_pulse pulse_out8 (
    .clk          (clk), 
    .reset        (OutputPulseEnables_reg[8]), 
    .polarity     (PulsePolarity_reg[19]), 
    .start        (start[8]), 
    .pulsedelay   (pulsedelay8), 
    .pulsewide    (pulsewide8), 
    .pulse        (pulse8)
    );

programable_pulse pulse_out9 (
    .clk          (clk), 
    .reset        (OutputPulseEnables_reg[9]), 
    .polarity     (PulsePolarity_reg[20]), 
    .start        (start[9]), 
    .pulsedelay   (pulsedelay9), 
    .pulsewide    (pulsewide9), 
    .pulse        (pulse9)
    );

programable_pulse pulse_out10 (
    .clk          (clk), 
    .reset        (OutputPulseEnables_reg[10]), 
    .polarity     (PulsePolarity_reg[21]), 
    .start        (start[10]), 
    .pulsedelay   (pulsedelay10), 
    .pulsewide    (pulsewide10), 
    .pulse        (pulse10)
    );

programable_pulse pulse_out11 (
    .clk          (clk), 
    .reset        (OutputPulseEnables_reg[11]), 
    .polarity     (PulsePolarity_reg[22]), 
    .start        (start[11]), 
    .pulsedelay   (pulsedelay11), 
    .pulsewide    (pulsewide11), 
    .pulse        (pulse11)
    );

programable_pulse pulse_out12 (
    .clk          (clk), 
    .reset        (OutputPulseEnables_reg[12]), 
    .polarity     (PulsePolarity_reg[23]), 
    .start        (start[12]), 
    .pulsedelay   (pulsedelay12), 
    .pulsewide    (pulsewide12), 
    .pulse        (pulse12)
    );

programable_pulse pulse_out13 (
    .clk          (clk), 
    .reset        (OutputPulseEnables_reg[13]), 
    .polarity     (PulsePolarity_reg[24]), 
    .start        (start[13]), 
    .pulsedelay   (pulsedelay13), 
    .pulsewide    (pulsewide13), 
    .pulse        (pulse13)
    );


endmodule

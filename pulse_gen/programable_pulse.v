/***************************************************************************************
实现功能简述：本模块主要功能是产生一个确定时钟周期长度（最长为256个时钟周期）的脉冲信号，
可以自己设定脉冲长度，输出的脉冲信号与时钟上升沿同步，脉冲宽度 = pulsewide + 1 时钟周期;

输入一个启动信号后，可以产生一个固定时钟周期长度的脉冲信号，与启动信号的长短无关！脉冲宽度可调！

1、可以调整输出脉冲宽度
2、只要输入一个启动信号，不论启动信号宽度——需要能够触发设计，就输出脉冲
3、在输出一个完整的脉冲过程中，不论输入多少个启动信号，都只会输出一个脉冲
4、不论启动脉冲的宽度多大，输出的脉冲宽度恒定 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
***************************************************************************************/


module programable_pulse ( clk, reset, polarity, start, pulsedelay, pulsewide, pulse );

   input clk, reset, start, polarity;
   input [31:0] pulsedelay;  //延时参数
   input [31:0] pulsewide;   //脉宽参数   
   output pulse;            //脉冲输出
 
   reg pulse, w_pulse;
   reg pulsedelay_count_en;  //延时计数器使能
	reg pulsewide_start;
   reg pulsewide_count_en;   //脉宽计数器使能
   reg [31:0] pulsedelay_count; //延时计数器
   reg [31:0] pulsewide_count;  //脉宽计数器

   
/***************************************************************************************
                                       延时计数器
***************************************************************************************/
//延时计数器启动标记，表示延时计数开始
always @ ( posedge clk )
   begin
     if ( reset == 'b0 )
        pulsedelay_count_en <= 'b0;
     else
        begin
          if ( start == 'b1 )
             pulsedelay_count_en <= 'b1;
          else if ( start == 'b0 && pulsedelay_count > pulsedelay )
             pulsedelay_count_en <= 'b0;
        end
   end

//延时计数器，延时 pulsedelay 个时钟周期   
always @ ( posedge clk )
   begin
     if ( reset == 'b0 )
        pulsedelay_count <= 'h00000000;
     else
        begin
          if ( pulsedelay_count_en == 'b0 )
             pulsedelay_count <= 'h00000000;
          else if ( pulsedelay_count_en == 'b1 && pulsedelay_count <= pulsedelay )
             pulsedelay_count <= pulsedelay_count + 1;
          else if ( pulsedelay_count_en == 'b0 && start == 'b0 )
             pulsedelay_count <= 'h00000000;
        end
     end

//输出脉宽计数器启动信号pulsewide_start
always @ ( posedge clk )
   begin
     if ( reset == 'b0 )
         pulsewide_start <= 'b0;
     else if ( pulsedelay_count == pulsedelay )
         pulsewide_start <= 'b1;
	 else
	     pulsewide_start <= 'b0;
   end
	 

	 
/***************************************************************************************
                                       脉宽计数器
***************************************************************************************/	 
//脉宽计数器启动标记，表示一次脉宽计数开始
always @ ( posedge clk )
   begin
     if ( reset == 'b0 )
        pulsewide_count_en <= 'b0;
     else
        begin
          if ( pulsewide_start == 'b1 )
             pulsewide_count_en <= 'b1;
          else if ( pulsewide_start == 'b0 && pulsewide_count > pulsewide )
             pulsewide_count_en <= 'b0;
        end
   end
 
//脉宽计数器，保证脉宽为 pulsewide 个时钟周期
always @ ( posedge clk )
   begin
     if ( reset == 'b0 )
        pulsewide_count <= 'h00000000;
     else
        begin
          if ( pulsewide_count_en == 'b0 )
             pulsewide_count <= 'h00000000;
          else if ( pulsewide_count_en == 'b1 && pulsewide_count <= pulsewide )
             pulsewide_count <= pulsewide_count + 1;
          else if ( pulsewide_count_en == 'b0 && pulsewide_start == 'b0 )
             pulsewide_count <= 'h00000000;
        end
     end
 
//输出定宽脉冲
always @ ( posedge clk )
   begin
     if ( reset == 'b0 || pulsewide_count >= pulsewide )
        w_pulse <= 'b0;
     else if ( pulsewide_count_en == 'b1 )
        w_pulse <= 'b1;
   end

/***************************************************************************************
                                       脉冲极性
***************************************************************************************/
always @ *
   begin
	   if (polarity == 1'b1)
		   pulse = !w_pulse;
		else
		   pulse = w_pulse;
		end


endmodule

/***************************************************************************************
ʵ�ֹ��ܼ�������ģ����Ҫ�����ǲ���һ��ȷ��ʱ�����ڳ��ȣ��Ϊ256��ʱ�����ڣ��������źţ�
�����Լ��趨���峤�ȣ�����������ź���ʱ��������ͬ���������� = pulsewide + 1 ʱ������;

����һ�������źź󣬿��Բ���һ���̶�ʱ�����ڳ��ȵ������źţ��������źŵĳ����޹أ������ȿɵ���

1�����Ե������������
2��ֻҪ����һ�������źţ����������źſ�ȡ�����Ҫ�ܹ�������ƣ����������
3�������һ����������������У�����������ٸ������źţ���ֻ�����һ������
4��������������Ŀ�ȶ������������Ⱥ㶨 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
***************************************************************************************/


module programable_pulse ( clk, reset, polarity, start, pulsedelay, pulsewide, pulse );

   input clk, reset, start, polarity;
   input [31:0] pulsedelay;  //��ʱ����
   input [31:0] pulsewide;   //�������   
   output pulse;            //�������
 
   reg pulse, w_pulse;
   reg pulsedelay_count_en;  //��ʱ������ʹ��
	reg pulsewide_start;
   reg pulsewide_count_en;   //���������ʹ��
   reg [31:0] pulsedelay_count; //��ʱ������
   reg [31:0] pulsewide_count;  //���������

   
/***************************************************************************************
                                       ��ʱ������
***************************************************************************************/
//��ʱ������������ǣ���ʾ��ʱ������ʼ
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

//��ʱ����������ʱ pulsedelay ��ʱ������   
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

//�����������������ź�pulsewide_start
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
                                       ���������
***************************************************************************************/	 
//���������������ǣ���ʾһ�����������ʼ
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
 
//�������������֤����Ϊ pulsewide ��ʱ������
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
 
//�����������
always @ ( posedge clk )
   begin
     if ( reset == 'b0 || pulsewide_count >= pulsewide )
        w_pulse <= 'b0;
     else if ( pulsewide_count_en == 'b1 )
        w_pulse <= 'b1;
   end

/***************************************************************************************
                                       ���弫��
***************************************************************************************/
always @ *
   begin
	   if (polarity == 1'b1)
		   pulse = !w_pulse;
		else
		   pulse = w_pulse;
		end


endmodule

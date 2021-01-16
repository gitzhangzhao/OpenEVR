

module delay_program (
     input             clk,
		
	  input             rst1,
     input      [9:0]  dataa1,
	  input      [9:0]  datab1,
	  output reg        rstRDY1,
     output reg        sclk1,
     output reg        sdata1,
     output reg        sload1,
	  
	  input             rst2,
     input      [9:0]  dataa2,
	  input      [9:0]  datab2,
	  output reg        rstRDY2,
     output reg        sclk2,
     output reg        sdata2,
     output reg        sload2,
	  
	  input             rst3,
     input      [9:0]  dataa3,
	  input      [9:0]  datab3,
	  output reg        rstRDY3,
     output reg        sclk3,
     output reg        sdata3,
     output reg        sload3
);

delay_ctrl delay_inst1 (
    .rst     (rst1), 
    .clk     (clk), 
    .dataa   (dataa1), 
    .datab   (datab1), 
    .rstRDY  (rstRDY1), 
    .sclk    (sclk1), 
    .sdata   (sdata1), 
    .sload   (sload1)
    );

delay_ctrl delay_inst2 (
    .rst     (rst2), 
    .clk     (clk), 
    .dataa   (dataa2), 
    .datab   (datab2), 
    .rstRDY  (rstRDY2), 
    .sclk    (sclk2), 
    .sdata   (sdata2), 
    .sload   (sload2)
    );
	 
delay_ctrl delay_inst3 (
    .rst     (rst3), 
    .clk     (clk), 
    .dataa   (dataa3), 
    .datab   (datab3), 
    .rstRDY  (rstRDY3), 
    .sclk    (sclk3), 
    .sdata   (sdata3), 
    .sload   (sload3)
    );


endmodule

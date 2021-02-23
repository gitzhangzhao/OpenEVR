--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:    09:11:20 10/18/05
-- Design Name:    
-- Module Name:    gtl_all - Behavioral
-- Project Name:   
-- Target Device:  
-- Tool versions:  
-- Description:
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity register_set is
port
(
	--VME module output signals
	addr_dma1		: in   std_logic_vector(18 downto 2);
	data_wr        : in   std_logic_vector(31 downto 0);
	data_rd			: out  std_logic_vector(31 downto 0);
	write_int		: in   std_logic;
	ds_dly_clk     : in   std_logic;
	board_sel		: in   std_logic;
	
	--the register reset signals
   --mappingRAM_clear_ready  :  in  std_logic;
   --mmcmdrp_resetRDY        :  in  std_logic; 
   --mmcmdrp_senRDY          :  in  std_logic; 
   --delay_rstRDY1           :  in  std_logic;
   --delay_rstRDY2           :  in  std_logic;
   --delay_rstRDY3           :  in  std_logic;

	
	--register output
	register00		: out  std_logic_vector(31 downto 0);
	register01		: out  std_logic_vector(31 downto 0);
	register02		: out  std_logic_vector(31 downto 0);
	register03		: out  std_logic_vector(31 downto 0);
	register04		: out  std_logic_vector(31 downto 0);
	register05		: out  std_logic_vector(31 downto 0);
	register06		: out  std_logic_vector(31 downto 0);
	register07		: out  std_logic_vector(31 downto 0);
	register08		: out  std_logic_vector(31 downto 0);
	register09		: out  std_logic_vector(31 downto 0);
	register10		: out  std_logic_vector(31 downto 0);
	register11		: out  std_logic_vector(31 downto 0);
	register12		: out  std_logic_vector(31 downto 0);
	register13		: out  std_logic_vector(31 downto 0);
	register14		: out  std_logic_vector(31 downto 0);
	register15		: out  std_logic_vector(31 downto 0);
	register16		: out  std_logic_vector(31 downto 0);
	register17		: out  std_logic_vector(31 downto 0);
	register18		: out  std_logic_vector(31 downto 0);
	register19		: out  std_logic_vector(31 downto 0);
	register20		: out  std_logic_vector(31 downto 0);
	register21		: out  std_logic_vector(31 downto 0);
	register22		: out  std_logic_vector(31 downto 0);
	register23		: out  std_logic_vector(31 downto 0);
	register24		: out  std_logic_vector(31 downto 0);
	register25		: out  std_logic_vector(31 downto 0);
	register26		: out  std_logic_vector(31 downto 0);
	register27		: out  std_logic_vector(31 downto 0);
	register28		: out  std_logic_vector(31 downto 0);
	register29		: out  std_logic_vector(31 downto 0);
	register30		: out  std_logic_vector(31 downto 0);
	register31		: out  std_logic_vector(31 downto 0);
   register32		: out  std_logic_vector(31 downto 0);
   register33		: out  std_logic_vector(31 downto 0);
   register34		: out  std_logic_vector(31 downto 0);
   register35		: out  std_logic_vector(31 downto 0);
   register36		: out  std_logic_vector(31 downto 0);
   register37		: out  std_logic_vector(31 downto 0);
   register38		: out  std_logic_vector(31 downto 0);
   register39		: out  std_logic_vector(31 downto 0);
   register40		: out  std_logic_vector(31 downto 0);
   register41		: out  std_logic_vector(31 downto 0);
   register42		: out  std_logic_vector(31 downto 0);
   register43		: out  std_logic_vector(31 downto 0);
   register44		: out  std_logic_vector(31 downto 0);
   register45		: out  std_logic_vector(31 downto 0);
   register46		: out  std_logic_vector(31 downto 0);
   register47		: out  std_logic_vector(31 downto 0)
	 	 
	);	
end register_set;

architecture Behavioral of register_set is

--component wr_rd_32bits_reset
--	port(ena_in			           :	in		std_logic;
--		  write_in		           :	in		std_logic;
--		  ds_in			           :	in		std_logic;
--		  addr_in		           :	in		std_logic_vector(18 downto 2);
--		  addr_set		           :	in		std_logic_vector(18 downto 2);
--		  data_wr_in	           :	in		std_logic_vector(31 downto 0);
--		  data_rd_out	           :	out	std_logic_vector(31 downto 0);
--		  mappingRAM_clear_ready  :   in    std_logic		  
--		  );
--end component;

--COMPONENT wr_rd_32bits_mmcm
--	PORT(
--		ena_in                    : IN std_logic;
--		write_in                  : IN std_logic;
--		ds_in                     : IN std_logic;
--		addr_in                   : IN std_logic_vector(18 downto 2);
--		addr_set                  : IN std_logic_vector(18 downto 2);
--		data_wr_in                : IN std_logic_vector(31 downto 0);
--		mmcmdrp_senRDY            : IN std_logic;
--		mmcmdrp_resetRDY          : IN std_logic;          
--		data_rd_out               : OUT std_logic_vector(31 downto 0)
--		);
--END COMPONENT;

--COMPONENT wr_rd_32bits_delaychip
--	PORT(
--		ena_in         : IN std_logic;
--		write_in       : IN std_logic;
--		ds_in          : IN std_logic;
--		addr_in        : IN std_logic_vector(18 downto 2);
--		addr_set       : IN std_logic_vector(18 downto 2);
--		data_wr_in     : IN std_logic_vector(31 downto 0);
--		delay_rstRDY1  : IN std_logic;
--		delay_rstRDY2  : IN std_logic;
--		delay_rstRDY3  : IN std_logic;          
--		data_rd_out    : OUT std_logic_vector(31 downto 0)
--		);
--END COMPONENT;

component wr_rd_32bits_m
	port(ena_in			:	in		std_logic;
		  write_in		:	in		std_logic;
		  ds_in			:	in		std_logic;
		  addr_in		:	in		std_logic_vector(18 downto 2);
		  addr_set		:	in		std_logic_vector(18 downto 2);
		  data_wr_in	:	in		std_logic_vector(31 downto 0);
		  data_rd_out	:	out	std_logic_vector(31 downto 0)
		  );
end component;

component wr_rd_32bits_m0
	port(ena_in			:	in		std_logic;
		  write_in		:	in		std_logic;
		  ds_in			:	in		std_logic;
		  addr_in		:	in		std_logic_vector(18 downto 2);
		  addr_set		:	in		std_logic_vector(18 downto 2);
		  data_wr_in	:	in		std_logic_vector(31 downto 0);
		  data_rd_out	:	out	std_logic_vector(31 downto 0)
		  );
end component;



	signal data_rd00, data_rd01			:			std_logic_vector(31 downto 0);
	signal data_rd02, data_rd03			:			std_logic_vector(31 downto 0);
	signal data_rd04, data_rd05			:			std_logic_vector(31 downto 0);
	signal data_rd06, data_rd07			:			std_logic_vector(31 downto 0);
	signal data_rd08, data_rd09			:			std_logic_vector(31 downto 0);
	signal data_rd10, data_rd11			:			std_logic_vector(31 downto 0);
	signal data_rd12, data_rd13			:			std_logic_vector(31 downto 0);
	signal data_rd14, data_rd15			:			std_logic_vector(31 downto 0);	
	signal data_rd16, data_rd17			:			std_logic_vector(31 downto 0);	
	signal data_rd18, data_rd19			:			std_logic_vector(31 downto 0);	
	signal data_rd20, data_rd21			:			std_logic_vector(31 downto 0);	
	signal data_rd22, data_rd23			:			std_logic_vector(31 downto 0);	
	signal data_rd24, data_rd25			:			std_logic_vector(31 downto 0);	
	signal data_rd26, data_rd27			:			std_logic_vector(31 downto 0);	
	signal data_rd28, data_rd29			:			std_logic_vector(31 downto 0);	
	signal data_rd30, data_rd31			:			std_logic_vector(31 downto 0);	
	signal data_rd32, data_rd33			:			std_logic_vector(31 downto 0);	
	signal data_rd34, data_rd35			:			std_logic_vector(31 downto 0);	
	signal data_rd36, data_rd37			:			std_logic_vector(31 downto 0);	
	signal data_rd38, data_rd39			:			std_logic_vector(31 downto 0);	
	signal data_rd40, data_rd41			:			std_logic_vector(31 downto 0);	
	signal data_rd42, data_rd43			:			std_logic_vector(31 downto 0);	
	signal data_rd44, data_rd45			:			std_logic_vector(31 downto 0);	
	signal data_rd46, data_rd47			:			std_logic_vector(31 downto 0);	


begin
	
	-- data writing and reading from here
	--data_register00 : wr_rd_32bits_reset
	--port map(ena_in		           => board_sel
	--		  ,write_in		           => write_int
	--		  ,ds_in			           => ds_dly_clk
	--		  ,addr_in		           => addr_dma1
	--		  ,addr_set		           => '0' & X"0000"
	--		  ,data_wr_in	           => data_wr
	--		  ,data_rd_out            => data_rd00
	--		  ,mappingRAM_clear_ready => mappingRAM_clear_ready         
	--		  );
			  
	data_register00 : wr_rd_32bits_m0
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0000"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd00
			  );	


	data_register01 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0001"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd01
			  );	

	data_register02 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0002"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd02
			  );

	--data_register03 : wr_rd_32bits_mmcm
	--port map(ena_in		     => board_sel
	--		  ,write_in		     => write_int
	--		  ,ds_in			     => ds_dly_clk
	--		  ,addr_in		     => addr_dma1
	--		  ,addr_set		     => '0' & X"0003"
	--		  ,data_wr_in	     => data_wr
	--		  ,data_rd_out	     => data_rd03
	--		  ,mmcmdrp_senRDY   => mmcmdrp_senRDY
	--	     ,mmcmdrp_resetRDY => mmcmdrp_resetRDY
	--		  );

	data_register03 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0003"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd03
			  );

	data_register04 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0004"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd04
			  );

	data_register05 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0005"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd05
			  );
			  
	data_register06 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0006"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd06
			  );

	data_register07 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0007"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd07
			  );

	data_register08 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0008"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd08
			  );

	data_register09 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0009"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd09
			  );

	data_register10 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"000a"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd10
			  );

	data_register11 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"000b"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd11
			  );

	data_register12 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"000c"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd12
			  );

	data_register13 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"000d"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd13
			  );

	data_register14 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"000e"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd14
			  );

	data_register15 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"000f"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd15
			  );
			  
	data_register16 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0010"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd16
			  );
			  
	data_register17 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0011"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd17
			  );
			  
	data_register18 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0012"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd18
			  );

	data_register19 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0013"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd19
			  );

	data_register20 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0014"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd20
			  );

	data_register21 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0015"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd21
			  );

	data_register22 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0016"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd22
			  );

	data_register23 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0017"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd23
			  );

	data_register24 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0018"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd24
			  );

	data_register25 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0019"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd25
			  );

	data_register26 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"001a"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd26
			  );

	data_register27 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"001b"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd27
			  );

	data_register28 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"001c"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd28
			  );

	data_register29 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"001d"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd29
			  );

	data_register30 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"001e"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd30
			  );

	data_register31 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"001f"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd31
			  );

	data_register32 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0020"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd32
			  );

	data_register33 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0021"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd33
			  );
			  
	data_register34 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0022"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd34
			  );
			  
	data_register35 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0023"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd35
			  );
			  
	data_register36 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0024"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd36
			  );
			  
	data_register37 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0025"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd37
			  );
			  
	--data_register38 : wr_rd_32bits_delaychip
	--port map(ena_in		  => board_sel
	--		  ,write_in		  => write_int
	--		  ,ds_in			  => ds_dly_clk
	--		  ,addr_in		  => addr_dma1
	--		  ,addr_set		  => '0' & X"0026"
	--		  ,data_wr_in	  => data_wr
	--		  ,data_rd_out   => data_rd38
	--		  ,delay_rstRDY1 => delay_rstRDY1
	--	     ,delay_rstRDY2 => delay_rstRDY2
	--	     ,delay_rstRDY3 => delay_rstRDY3
	--		  );
			  
	data_register38 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0026"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd38
			  );
			  
			  
	data_register39 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0027"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd39
			  );
			  
	data_register40 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0028"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd40
			  );
			  
	data_register41 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"0029"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd41
			  );
			  
	data_register42 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"002a"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd42
			  );
			  
	data_register43 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"002b"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd43
			  );
			  
	data_register44 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"002c"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd44
			  );
			  
	data_register45 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"002d"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd45
			  );
			  
	data_register46 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"002e"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd46
			  );
			  
	data_register47 : wr_rd_32bits_m
	port map(ena_in		=> board_sel
			  ,write_in		=> write_int
			  ,ds_in			=> ds_dly_clk
			  ,addr_in		=> addr_dma1
			  ,addr_set		=> '0' & X"002f"
			  ,data_wr_in	=> data_wr
			  ,data_rd_out	=> data_rd47
			  );

			  
--	data_read_selection : process (board_sel, addr_dma1, write_int)
--	begin
--		if(board_sel = '1' and write_int = '0') then
--			if(addr_dma1 = '0' & X"0000") then
--				data_rd <= data_rd00;
--			elsif(addr_dma1 = '0' & X"0001") then
--				data_rd <= data_rd01;
--			elsif(addr_dma1 = '0' & X"0002") then
--				data_rd <= data_rd02;
--			elsif(addr_dma1 = '0' & X"0003") then
--				data_rd <= data_rd03;
--			elsif(addr_dma1 = '0' & X"0004") then
--				data_rd <= data_rd04;
--			elsif(addr_dma1 = '0' & X"0005") then
--				data_rd <= data_rd05;
--			elsif(addr_dma1 = '0' & X"0006") then
--				data_rd <= data_rd06;
--			elsif(addr_dma1 = '0' & X"0007") then
--				data_rd <= data_rd07;
--			elsif(addr_dma1 = '0' & X"0008") then
--				data_rd <= data_rd08;
--			elsif(addr_dma1 = '0' & X"0009") then
--				data_rd <= data_rd09;
--			elsif(addr_dma1 = '0' & X"000a") then
--				data_rd <= data_rd10;
--			elsif(addr_dma1 = '0' & X"000b") then
--				data_rd <= data_rd11;
--			elsif(addr_dma1 = '0' & X"000c") then
--				data_rd <= data_rd12;
--			elsif(addr_dma1 = '0' & X"000d") then
--				data_rd <= data_rd13;
--			elsif(addr_dma1 = '0' & X"000e") then
--				data_rd <= data_rd14;
--			elsif(addr_dma1 = '0' & X"000f") then
--				data_rd <= data_rd15; 
--			elsif(addr_dma1 = '0' & X"0010") then
--				data_rd <= data_rd16; 
--			elsif(addr_dma1 = '0' & X"0011") then
--				data_rd <= data_rd17; 
--			elsif(addr_dma1 = '0' & X"0012") then
--				data_rd <= data_rd18; 
--			elsif(addr_dma1 = '0' & X"0013") then
--				data_rd <= data_rd19; 
--			elsif(addr_dma1 = '0' & X"0014") then
--				data_rd <= data_rd20; 
--			elsif(addr_dma1 = '0' & X"0015") then
--				data_rd <= data_rd21; 
--			elsif(addr_dma1 = '0' & X"0016") then
--				data_rd <= data_rd22; 
--			elsif(addr_dma1 = '0' & X"0017") then
--				data_rd <= data_rd23; 
--			elsif(addr_dma1 = '0' & X"0018") then
--				data_rd <= data_rd24; 
--			elsif(addr_dma1 = '0' & X"0019") then
--				data_rd <= data_rd25; 
--			elsif(addr_dma1 = '0' & X"001a") then
--				data_rd <= data_rd26; 
--			elsif(addr_dma1 = '0' & X"001b") then
--				data_rd <= data_rd27; 
--			elsif(addr_dma1 = '0' & X"001c") then
--				data_rd <= data_rd28; 
--			elsif(addr_dma1 = '0' & X"001d") then
--				data_rd <= data_rd29; 
--			elsif(addr_dma1 = '0' & X"001e") then
--				data_rd <= data_rd30; 
--			elsif(addr_dma1 = '0' & X"001f") then
--				data_rd <= data_rd31;
--			elsif(addr_dma1 = '0' & X"0020") then
--				data_rd <= data_rd32; 
--			elsif(addr_dma1 = '0' & X"0021") then
--				data_rd <= data_rd33; 		 				
--			elsif(addr_dma1 = '0' & X"0022") then
--				data_rd <= data_rd34; 		 				
--			elsif(addr_dma1 = '0' & X"0023") then
--				data_rd <= data_rd35; 		 				
--			elsif(addr_dma1 = '0' & X"0024") then
--				data_rd <= data_rd36; 		 				
--			elsif(addr_dma1 = '0' & X"0025") then
--				data_rd <= data_rd37; 		 				
--			elsif(addr_dma1 = '0' & X"0026") then
--				data_rd <= data_rd38; 		 				
--			elsif(addr_dma1 = '0' & X"0027") then
--				data_rd <= data_rd39; 		 				
--			elsif(addr_dma1 = '0' & X"0028") then
--				data_rd <= data_rd40; 		 				
--			elsif(addr_dma1 = '0' & X"0029") then
--				data_rd <= data_rd41; 		 				
--			elsif(addr_dma1 = '0' & X"002a") then
--				data_rd <= data_rd42; 		 				
--			elsif(addr_dma1 = '0' & X"002b") then
--				data_rd <= data_rd43; 		 				
--			elsif(addr_dma1 = '0' & X"002c") then
--				data_rd <= data_rd44; 		 				
--			elsif(addr_dma1 = '0' & X"002d") then
--				data_rd <= data_rd45; 		 				
--			elsif(addr_dma1 = '0' & X"002e") then
--				data_rd <= data_rd46; 		 				
--			elsif(addr_dma1 = '0' & X"002f") then
--				data_rd <= data_rd47; 
--			else
--				data_rd <= X"efefefef";
--			end if;
--		end if;
--	end process;


  data_read_selection : process(board_sel, addr_dma1, write_int)
  begin
     if(board_sel = '1' and write_int = '0') then
        if(addr_dma1 = '0' & X"0000") then
            data_rd <= data_rd00;
        elsif(addr_dma1 = '0' & X"0001") then
            data_rd <= data_rd01;
        elsif(addr_dma1 = '0' & X"0002") then
            data_rd <= data_rd02;
        elsif(addr_dma1 = '0' & X"0003") then
            data_rd <= data_rd03;
        elsif(addr_dma1 = '0' & X"0004") then
            data_rd <= data_rd04;
        elsif(addr_dma1 = '0' & X"0005") then
            data_rd <= data_rd05;
        elsif(addr_dma1 = '0' & X"0006") then
            data_rd <= data_rd06;
        elsif(addr_dma1 = '0' & X"0007") then
            data_rd <= data_rd07;
        elsif(addr_dma1 = '0' & X"0008") then
            data_rd <= data_rd08;
        elsif(addr_dma1 = '0' & X"0009") then
            data_rd <= data_rd09;
        elsif(addr_dma1 = '0' & X"000a") then
            data_rd <= data_rd10;
        elsif(addr_dma1 = '0' & X"000b") then
            data_rd <= data_rd11;
        elsif(addr_dma1 = '0' & X"000c") then
            data_rd <= data_rd12;
        elsif(addr_dma1 = '0' & X"000d") then
            data_rd <= data_rd13;
        elsif(addr_dma1 = '0' & X"000e") then
            data_rd <= data_rd14;
        elsif(addr_dma1 = '0' & X"000f") then
            data_rd <= data_rd15;
        elsif(addr_dma1 = '1' & X"0000") then
            data_rd <= data_rd00;
        elsif(addr_dma1 = '1' & X"0001") then
            data_rd <= data_rd01;
        elsif(addr_dma1 = '1' & X"0002") then
            data_rd <= data_rd02;
        elsif(addr_dma1 = '1' & X"0003") then
            data_rd <= data_rd03;
        elsif(addr_dma1 = '1' & X"0004") then
            data_rd <= data_rd04;
        elsif(addr_dma1 = '1' & X"0005") then
            data_rd <= data_rd05;
        elsif(addr_dma1 = '1' & X"0006") then
            data_rd <= data_rd06;
        elsif(addr_dma1 = '1' & X"0007") then
            data_rd <= data_rd07;
        elsif(addr_dma1 = '1' & X"0008") then
            data_rd <= data_rd08;
        elsif(addr_dma1 = '1' & X"0009") then
            data_rd <= data_rd09;
        elsif(addr_dma1 = '1' & X"000a") then
            data_rd <= data_rd10;
        elsif(addr_dma1 = '1' & X"000b") then
            data_rd <= data_rd11;
        elsif(addr_dma1 = '1' & X"000c") then
            data_rd <= data_rd12;
        elsif(addr_dma1 = '1' & X"000d") then
            data_rd <= data_rd13;
        elsif(addr_dma1 = '1' & X"000e") then
            data_rd <= data_rd14;
        elsif(addr_dma1 = '1' & X"000f") then
            data_rd <= data_rd15;
        else
            data_rd <= X"efefefef";
        end if;
     end if;
  end process;


--	data_read_selection : process (board_sel, addr_dma1, write_int,
--	                               data_rd00, data_rd01, data_rd02, data_rd03,
--											 data_rd04, data_rd05, data_rd06, data_rd07,
--											 data_rd08, data_rd09, data_rd10, data_rd11,
--											 data_rd12, data_rd13, data_rd14, data_rd15,
--											 data_rd16, data_rd17, data_rd18, data_rd19,
--											 data_rd20, data_rd21, data_rd22, data_rd23,
--											 data_rd24, data_rd25, data_rd26, data_rd27,
--											 data_rd28, data_rd29, data_rd30, data_rd31,
--											 data_rd32, data_rd33, data_rd34, data_rd35,
--											 data_rd36, data_rd37, data_rd38, data_rd39,
--											 data_rd40, data_rd41, data_rd42, data_rd43,
--											 data_rd44, data_rd45, data_rd46, data_rd47)
--	begin
--		if(board_sel = '1' and write_int = '0') then
--			
--			case addr_dma1 is
--			   when "00000000000000000"  =>  data_rd <= data_rd00;
--			   when "00000000000000001"  =>  data_rd <= data_rd01;
--			   when "00000000000000010"  =>	data_rd <= data_rd02;
--			   when "00000000000000011"  =>	data_rd <= data_rd03;
--			   when "00000000000000100"  =>	data_rd <= data_rd04;
--			   when "00000000000000101"  =>  data_rd <= data_rd05;
--			   when "00000000000000110"  =>  data_rd <= data_rd06;
--			   when "00000000000000111"  => 	data_rd <= data_rd07;
--			   when "00000000000001000"  =>	data_rd <= data_rd08;
-- 		   when "00000000000001001"  =>  data_rd <= data_rd09;
--			   when "00000000000001010"  =>	data_rd <= data_rd10;
--			   when "00000000000001011"  => 	data_rd <= data_rd11;
--				when "00000000000001100"  =>	data_rd <= data_rd12;
--			   when "00000000000001101"  =>	data_rd <= data_rd13;
--			   when "00000000000001110"  =>	data_rd <= data_rd14;
--			   when "00000000000001111"  =>	data_rd <= data_rd15; 
--			   when "00000000000010000"  =>	data_rd <= data_rd16; 
--			   when "00000000000010001"  =>	data_rd <= data_rd17; 
--			   when "00000000000010010"  =>	data_rd <= data_rd18; 
--			   when "00000000000010011"  =>	data_rd <= data_rd19; 
--				when "00000000000010100"  =>	data_rd <= data_rd20; 
--          when "00000000000010101"  =>	data_rd <= data_rd21; 
--			   when "00000000000010110"  =>	data_rd <= data_rd22; 
--			   when "00000000000010111"  =>	data_rd <= data_rd23; 
--			   when "00000000000011000"  =>	data_rd <= data_rd24; 
--			   when "00000000000011001"  =>	data_rd <= data_rd25; 
--			   when "00000000000011010"  =>	data_rd <= data_rd26; 
--			   when "00000000000011011"  =>	data_rd <= data_rd27; 
--			   when "00000000000011100"  =>	data_rd <= data_rd28; 
--			   when "00000000000011101"  =>	data_rd <= data_rd29; 
--			   when "00000000000011110"  =>	data_rd <= data_rd30; 
--			   when "00000000000011111"  =>	data_rd <= data_rd31;
--			   when "00000000000100000"  =>	data_rd <= data_rd32; 
--			   when "00000000000100001"  =>	data_rd <= data_rd33; 		 				
--			   when "00000000000100010"  =>	data_rd <= data_rd34; 		 				
--			   when "00000000000100011"  =>	data_rd <= data_rd35; 		 				
--			   when "00000000000100100"  =>	data_rd <= data_rd36; 		 				
--			   when "00000000000100101"  =>	data_rd <= data_rd37; 		 				
--			   when "00000000000100110"  =>	data_rd <= data_rd38; 		 				
--			   when "00000000000100111"  =>	data_rd <= data_rd39; 		 				
--			   when "00000000000101000"  =>	data_rd <= data_rd40; 		 				
--			   when "00000000000101001"  =>	data_rd <= data_rd41; 		 				
--			   when "00000000000101010"  =>	data_rd <= data_rd42; 		 				
--			   when "00000000000101011"  =>	data_rd <= data_rd43; 		 				
--			   when "00000000000101100"  =>	data_rd <= data_rd44; 		 				
--			   when "00000000000101101"  =>	data_rd <= data_rd45; 		 				
--			   when "00000000000101110"  =>	data_rd <= data_rd46; 		 				
--			   when "00000000000101111"  =>	data_rd <= data_rd47; 
--			   when others               => 	data_rd <= X"efefefef";	
--         end case;				
--			
--		else data_rd <= X"00000000";
--		end if;
--	end process;
	-- data writing and reading end here
	
	register00  <=  data_rd00;
	register01  <=  data_rd01;
	register02  <=  data_rd02;
	register03  <=  data_rd03;
	register04  <=  data_rd04;
	register05  <=  data_rd05;
	register06  <=  data_rd06;
	register07  <=  data_rd07;
	register08  <=  data_rd08;
	register09  <=  data_rd09;
	register10  <=  data_rd10;
	register11  <=  data_rd11;
	register12  <=  data_rd12;
	register13  <=  data_rd13;
	register14  <=  data_rd14;
	register15  <=  data_rd15;
	register16  <=  data_rd16;
	register17  <=  data_rd17;
	register18  <=  data_rd18;
	register19  <=  data_rd19;
	register20  <=  data_rd20;
	register21  <=  data_rd21;
	register22  <=  data_rd22;
	register23  <=  data_rd23;
	register24  <=  data_rd24;
	register25  <=  data_rd25;
	register26  <=  data_rd26;
	register27  <=  data_rd27;
	register28  <=  data_rd28;
	register29  <=  data_rd29;
	register30  <=  data_rd30;
	register31  <=  data_rd31;
	register32  <=  data_rd32;
	register33  <=  data_rd33;
	register34  <=  data_rd34;
	register35  <=  data_rd35;
	register36  <=  data_rd36;
	register37  <=  data_rd37;
	register38  <=  data_rd38;
	register39  <=  data_rd39;
	register40  <=  data_rd40;
	register41  <=  data_rd41;
	register42  <=  data_rd42;
	register43  <=  data_rd43;
	register44  <=  data_rd44;
	register45  <=  data_rd45;
	register46  <=  data_rd46;
	register47  <=  data_rd47;

end Behavioral;


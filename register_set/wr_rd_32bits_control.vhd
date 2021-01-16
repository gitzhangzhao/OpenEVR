----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:19:46 07/17/2013 
-- Design Name: 
-- Module Name:    wr_rd_32bits_reset - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity wr_rd_32bits_control is
	port(ena_in			           :	in		std_logic;	     
		  write_in		           :	in		std_logic;
		  ds_in			           :	in		std_logic;
		  addr_in		           :	in		std_logic_vector(18 downto 2);
		  addr_set		           :	in		std_logic_vector(18 downto 2);
		  data_wr_in	           :	in		std_logic_vector(31 downto 0);
		  data_rd_out	           :	out	std_logic_vector(31 downto 0);
		  
		  setbit1                 :   in    std_logic; --register bit01 set
		  setbit2                 :   in    std_logic  --register bit02 set
	  );
end wr_rd_32bits_control;

architecture Behavioral of wr_rd_32bits_control is

	signal	data_reg		:	std_logic_vector(31 downto 0) := X"00000000";

begin

	data_writing_generation00 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(0) <= data_wr_in(0);
			end if;
		end if;
	end process;

----outside signal can direct set the bit value
	data_writing_generation01 : process(setbit1, ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
	   data_reg(1) <= setbit1;
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(1) <= data_wr_in(1);
			end if;
		end if;
	end process;
-------------------	
	
----outside signal can direct set the bit value   
	data_writing_generation02 : process(setbit2, ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
	   data_reg(2) <= setbit2;
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(2) <= data_wr_in(2);
			end if;
		end if;
	end process;
-------------------

	data_writing_generation03 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(3) <= data_wr_in(3);
			end if;
		end if;
	end process;

	data_writing_generation04 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(4) <= data_wr_in(4);
			end if;
		end if;
	end process;

	data_writing_generation05 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(5) <= data_wr_in(5);
			end if;
		end if;
	end process;

	data_writing_generation06 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(6) <= data_wr_in(6);
			end if;
		end if;
	end process;
	
	data_writing_generation07 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(7) <= data_wr_in(7);
			end if;
		end if;
	end process;

	data_writing_generation08 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(8) <= data_wr_in(8);
			end if;
		end if;
	end process;	

	data_writing_generation09 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(9) <= data_wr_in(9);
			end if;
		end if;
	end process;
	
	data_writing_generation10 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(10) <= data_wr_in(10);
			end if;
		end if;
	end process;
	
	data_writing_generation11 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(11) <= data_wr_in(11);
			end if;
		end if;
	end process;
	
	data_writing_generation12 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(12) <= data_wr_in(12);
			end if;
		end if;
	end process;
	
	data_writing_generation13 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(13) <= data_wr_in(13);
			end if;
		end if;
	end process;
	
	data_writing_generation14 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(14) <= data_wr_in(14);
			end if;
		end if;
	end process;
	
	data_writing_generation15 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(15) <= data_wr_in(15);
			end if;
		end if;
	end process;
	
	data_writing_generation16 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(16) <= data_wr_in(16);
			end if;
		end if;
	end process;

	data_writing_generation17 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(17) <= data_wr_in(17);
			end if;
		end if;
	end process;

	data_writing_generation18 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(18) <= data_wr_in(18);
			end if;
		end if;
	end process;
	
	data_writing_generation19 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(19) <= data_wr_in(19);
			end if;
		end if;
	end process;
	
	data_writing_generation20 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(20) <= data_wr_in(20);
			end if;
		end if;
	end process;
	
	data_writing_generation21 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(21) <= data_wr_in(21);
			end if;
		end if;
	end process;
	
	data_writing_generation22 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(22) <= data_wr_in(22);
			end if;
		end if;
	end process;
	
	data_writing_generation23 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(23) <= data_wr_in(23);
			end if;
		end if;
	end process;
	
	data_writing_generation24 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(24) <= data_wr_in(24);
			end if;
		end if;
	end process;
	
	data_writing_generation25 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(25) <= data_wr_in(25);
			end if;
		end if;
	end process;
	
	data_writing_generation26 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(26) <= data_wr_in(26);
			end if;
		end if;
	end process;
	
	data_writing_generation27 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(27) <= data_wr_in(27);
			end if;
		end if;
	end process;
	
	data_writing_generation28 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(28) <= data_wr_in(28);
			end if;
		end if;
	end process;
	
	data_writing_generation29 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(29) <= data_wr_in(29);
			end if;
		end if;
	end process;
	
	data_writing_generation30 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(30) <= data_wr_in(30);
			end if;
		end if;
	end process;
	
	data_writing_generation31 : process(ena_in, write_in, ds_in, addr_in, addr_set, data_wr_in)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg(31) <= data_wr_in(31);
			end if;
		end if;
	end process;	
	
	data_rd_out <= data_reg;
	
end Behavioral;


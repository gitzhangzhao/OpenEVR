----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:19:46 07/17/2013 
-- Design Name: 
-- Module Name:    wr_rd_32bits_m - Behavioral 
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

entity wr_rd_32bits_m is
	port(ena_in			:	in		std_logic;
		  write_in		:	in		std_logic;
		  ds_in			:	in		std_logic;
		  addr_in		:	in		std_logic_vector(18 downto 2);
		  addr_set		:	in		std_logic_vector(18 downto 2);
		  data_wr_in	:	in		std_logic_vector(31 downto 0);
		  data_rd_out	:	out	std_logic_vector(31 downto 0)
		  );
end wr_rd_32bits_m;

architecture Behavioral of wr_rd_32bits_m is

	signal	data_reg		:	std_logic_vector(31 downto 0) := X"00000000";

begin

	data_writing_generation : process(ena_in, write_in, ds_in, addr_in, data_wr_in, addr_set)
	begin
		if(ena_in = '1' and write_in = '1' and addr_in = addr_set) then
			if(ds_in'event and ds_in = '1') then
				data_reg <= data_wr_in;
			end if;
		end if;
	end process;
	
	data_rd_out <= data_reg;
	
end Behavioral;


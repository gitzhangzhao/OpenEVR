library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity delay_ctrl is
   port (
      rst            : in std_logic;
      clk            : in std_logic;
      dataa          : in std_logic_vector(9 downto 0);
		datab          : in std_logic_vector(9 downto 0);
		rstRDY         : out std_logic;
      sclk           : out std_logic;
      sdata          : out std_logic; 
      sload          : out std_logic);
end delay_ctrl;

architecture rtl of delay_ctrl is

   signal count : std_logic_vector(5 downto 0);

begin
   process(rst,clk)
   begin
      if (rst='0') then
         count <= (others=>'0');
      elsif rising_edge(clk) then
		   if (count="111111" ) then
            count <= count;
			else
			   count <= count + '1';
			end if;
      end if;
   end process;

   process(rst,clk)
   begin
      if (rst='0') then
         sclk   <= '0';
         sload  <= '1';
         sdata  <= '0';
			rstRDY <= '0';
      elsif rising_edge(clk) then
         case count is
            when "000000" => sclk<='0'; sload<='1'; sdata<='0';      rstRDY <= '0';
            when "000001" => sclk<='0'; sload<='0'; sdata<=dataa(0); rstRDY <= '0'; 
            when "000010" => sclk<='1'; sload<='0'; sdata<=dataa(0); rstRDY <= '0';
            when "000011" => sclk<='0'; sload<='0'; sdata<=dataa(1); rstRDY <= '0';
            when "000100" => sclk<='1'; sload<='0'; sdata<=dataa(1); rstRDY <= '0';
            when "000101" => sclk<='0'; sload<='0'; sdata<=dataa(2); rstRDY <= '0';
            when "000110" => sclk<='1'; sload<='0'; sdata<=dataa(2); rstRDY <= '0';
            when "000111" => sclk<='0'; sload<='0'; sdata<=dataa(3); rstRDY <= '0';
            when "001000" => sclk<='1'; sload<='0'; sdata<=dataa(3); rstRDY <= '0';
            when "001001" => sclk<='0'; sload<='0'; sdata<=dataa(4); rstRDY <= '0';
            when "001010" => sclk<='1'; sload<='0'; sdata<=dataa(4); rstRDY <= '0';
            when "001011" => sclk<='0'; sload<='0'; sdata<=dataa(5); rstRDY <= '0';
            when "001100" => sclk<='1'; sload<='0'; sdata<=dataa(5); rstRDY <= '0';
            when "001101" => sclk<='0'; sload<='0'; sdata<=dataa(6); rstRDY <= '0';
            when "001110" => sclk<='1'; sload<='0'; sdata<=dataa(6); rstRDY <= '0';
            when "001111" => sclk<='0'; sload<='0'; sdata<=dataa(7); rstRDY <= '0';
            when "010000" => sclk<='1'; sload<='0'; sdata<=dataa(7); rstRDY <= '0';
            when "010001" => sclk<='0'; sload<='0'; sdata<=dataa(8); rstRDY <= '0';
            when "010010" => sclk<='1'; sload<='0'; sdata<=dataa(8); rstRDY <= '0';
            when "010011" => sclk<='0'; sload<='0'; sdata<=dataa(9); rstRDY <= '0';
            when "010100" => sclk<='1'; sload<='0'; sdata<=dataa(9); rstRDY <= '0';
            when "010101" => sclk<='0'; sload<='0'; sdata<=datab(0); rstRDY <= '0';
            when "010110" => sclk<='1'; sload<='0'; sdata<=datab(0); rstRDY <= '0';
            when "010111" => sclk<='0'; sload<='0'; sdata<=datab(1); rstRDY <= '0';
            when "011000" => sclk<='1'; sload<='0'; sdata<=datab(1); rstRDY <= '0';
            when "011001" => sclk<='0'; sload<='0'; sdata<=datab(2); rstRDY <= '0';
            when "011010" => sclk<='1'; sload<='0'; sdata<=datab(2); rstRDY <= '0';
            when "011011" => sclk<='0'; sload<='0'; sdata<=datab(3); rstRDY <= '0';
            when "011100" => sclk<='1'; sload<='0'; sdata<=datab(3); rstRDY <= '0';
            when "011101" => sclk<='0'; sload<='0'; sdata<=datab(4); rstRDY <= '0';
            when "011110" => sclk<='1'; sload<='0'; sdata<=datab(4); rstRDY <= '0';
            when "011111" => sclk<='0'; sload<='0'; sdata<=datab(5); rstRDY <= '0';
            when "100000" => sclk<='1'; sload<='0'; sdata<=datab(5); rstRDY <= '0';
            when "100001" => sclk<='0'; sload<='0'; sdata<=datab(6); rstRDY <= '0';
            when "100010" => sclk<='1'; sload<='0'; sdata<=datab(6); rstRDY <= '0';
            when "100011" => sclk<='0'; sload<='0'; sdata<=datab(7); rstRDY <= '0';
            when "100100" => sclk<='1'; sload<='0'; sdata<=datab(7); rstRDY <= '0';
            when "100101" => sclk<='0'; sload<='0'; sdata<=datab(8); rstRDY <= '0';
            when "100110" => sclk<='1'; sload<='0'; sdata<=datab(8); rstRDY <= '0';
            when "100111" => sclk<='0'; sload<='0'; sdata<=datab(9); rstRDY <= '0';
            when "101000" => sclk<='1'; sload<='0'; sdata<=datab(9); rstRDY <= '0';
            when "101001" => sclk<='0'; sload<='1'; sdata<='0';      rstRDY <= '1';
				
            when others   => sclk<='0'; sload<='1'; sdata<='0';      rstRDY <= '1';
         end case;
      end if;
   end process;
               
end rtl;

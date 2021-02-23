----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:46:09 07/12/2013 
-- Design Name: 
-- Module Name:    IO32_PORTS - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
library UNISIM;
use UNISIM.VComponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IO32_PORTS is
   port(I   : in    std_logic_vector(31 downto 0);
	     O   : out   std_logic_vector(31 downto 0);
		  T   : in    std_logic;
		  IO  : inout std_logic_vector(31 downto 0)
		  );
end IO32_PORTS;

architecture Behavioral of IO32_PORTS is

--   attribute IOSTANDARD : STRING ;
--   attribute SLEW       : STRING ;
--  attribute DRIVE      : STRING ;
   attribute BOX_TYPE   : STRING ;
   component IOBUF
      port ( I  : in    std_logic;   -- Buffer input
             IO : inout std_logic;   -- Buffer inout port (connect directly to top-level port) 
             O  : out   std_logic;   -- Buffer output 
             T  : in    std_logic);  -- 3-state enable input, high=input, low=output 
   end component;
--   attribute IOSTANDARD of IOBUF : COMPONENT is "LVTTL";
--   attribute SLEW of IOBUF : COMPONENT is "SLOW";
--   attribute DRIVE of IOBUF : COMPONENT is "12";
   attribute BOX_TYPE of IOBUF : COMPONENT is "BLACK_BOX";
	
begin

IO_PORT00 : IOBUF
   port map(I  =>  I(0)
           ,O  =>  O(0)
		     ,IO => IO(0)
		     ,T  =>  T
		     );


IO_PORT01 : IOBUF
   port map(I  =>  I(1)
           ,O  =>  O(1)
		     ,IO => IO(1)
		     ,T  =>  T
		     );

				  
IO_PORT02 : IOBUF
   port map(I  =>  I(2)
           ,O  =>  O(2)
		     ,IO => IO(2)
		     ,T  =>  T
		     );

				  
IO_PORT03 : IOBUF
   port map(I  =>  I(3)
           ,O  =>  O(3)
		     ,IO => IO(3)
		     ,T  =>  T
		     );

				  
IO_PORT04 : IOBUF
   port map(I  =>  I(4)
           ,O  =>  O(4)
		     ,IO => IO(4)
		     ,T  =>  T
		     );

				  
IO_PORT05 : IOBUF
   port map(I  =>  I(5)
           ,O  =>  O(5)
		     ,IO => IO(5)
		     ,T  =>  T
		     );

				  
IO_PORT06 : IOBUF
   port map(I  =>  I(6)
           ,O  =>  O(6)
		     ,IO => IO(6)
		     ,T  =>  T
		     );

				  
IO_PORT07 : IOBUF
   port map(I  =>  I(7)
           ,O  =>  O(7)
		     ,IO => IO(7)
		     ,T  =>  T
		     );

				  
IO_PORT08 : IOBUF
   port map(I  =>  I(8)
           ,O  =>  O(8)
		     ,IO => IO(8)
		     ,T  =>  T
		     );

				  
IO_PORT09 : IOBUF
   port map(I  =>  I(9)
           ,O  =>  O(9)
		     ,IO => IO(9)
		     ,T  =>  T
		     );

				  
IO_PORT10 : IOBUF
   port map(I  =>  I(10)
           ,O  =>  O(10)
		     ,IO => IO(10)
		     ,T  =>  T
		     );

				  
IO_PORT11 : IOBUF
   port map(I  =>  I(11)
           ,O  =>  O(11)
		     ,IO => IO(11)
		     ,T  =>  T
		     );

				  
IO_PORT12 : IOBUF
   port map(I  =>  I(12)
           ,O  =>  O(12)
		     ,IO => IO(12)
		     ,T  =>  T
		     );

				  
IO_PORT13 : IOBUF
   port map(I  =>  I(13)
           ,O  =>  O(13)
		     ,IO => IO(13)
		     ,T  =>  T
		     );

				  
IO_PORT14 : IOBUF
   port map(I  =>  I(14)
           ,O  =>  O(14)
		     ,IO => IO(14)
		     ,T  =>  T
		     );

				  
IO_PORT15 : IOBUF
   port map(I  =>  I(15)
           ,O  =>  O(15)
		     ,IO => IO(15)
		     ,T  =>  T
		     );


IO_PORT16 : IOBUF
   port map(I  =>  I(16)
           ,O  =>  O(16)
		     ,IO => IO(16)
		     ,T  =>  T
		     );


IO_PORT17 : IOBUF
   port map(I  =>  I(17)
           ,O  =>  O(17)
		     ,IO => IO(17)
		     ,T  =>  T
		     );


IO_PORT18 : IOBUF
   port map(I  =>  I(18)
           ,O  =>  O(18)
		     ,IO => IO(18)
		     ,T  =>  T
		     );


IO_PORT19 : IOBUF
   port map(I  =>  I(19)
           ,O  =>  O(19)
		     ,IO => IO(19)
		     ,T  =>  T
		     );


IO_PORT20 : IOBUF
   port map(I  =>  I(20)
           ,O  =>  O(20)
		     ,IO => IO(20)
		     ,T  =>  T
		     );


IO_PORT21 : IOBUF
   port map(I  =>  I(21)
           ,O  =>  O(21)
		     ,IO => IO(21)
		     ,T  =>  T
		     );


IO_PORT22 : IOBUF
   port map(I  =>  I(22)
           ,O  =>  O(22)
		     ,IO => IO(22)
		     ,T  =>  T
		     );


IO_PORT23 : IOBUF
   port map(I  =>  I(23)
           ,O  =>  O(23)
		     ,IO => IO(23)
		     ,T  =>  T
		     );


IO_PORT24 : IOBUF
   port map(I  =>  I(24)
           ,O  =>  O(24)
		     ,IO => IO(24)
		     ,T  =>  T
		     );


IO_PORT25 : IOBUF
   port map(I  =>  I(25)
           ,O  =>  O(25)
		     ,IO => IO(25)
		     ,T  =>  T
		     );


IO_PORT26 : IOBUF
   port map(I  =>  I(26)
           ,O  =>  O(26)
		     ,IO => IO(26)
		     ,T  =>  T
		     );


IO_PORT27 : IOBUF
   port map(I  =>  I(27)
           ,O  =>  O(27)
		     ,IO => IO(27)
		     ,T  =>  T
		     );


IO_PORT28 : IOBUF
   port map(I  =>  I(28)
           ,O  =>  O(28)
		     ,IO => IO(28)
		     ,T  =>  T
		     );


IO_PORT29 : IOBUF
   port map(I  =>  I(29)
           ,O  =>  O(29)
		     ,IO => IO(29)
		     ,T  =>  T
		     );


IO_PORT30 : IOBUF
   port map(I  =>  I(30)
           ,O  =>  O(30)
		     ,IO => IO(30)
		     ,T  =>  T
		     );


IO_PORT31 : IOBUF
   port map(I  =>  I(31)
           ,O  =>  O(31)
		     ,IO => IO(31)
		     ,T  =>  T
		     );


end Behavioral;


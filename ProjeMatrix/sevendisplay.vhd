----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:07:21 12/12/2019 
-- Design Name: 
-- Module Name:    sevendisplay - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevendisplay is
    Port ( sw : in  STD_LOGIC_VECTOR (3 downto 0);
           sevenbit : out  STD_LOGIC_VECTOR (0 to 6));
end sevendisplay;

architecture Behavioral of sevendisplay is

begin
process(sw)
begin 
if  sw="0000" then--0
sevenbit<="0000001";
elsif sw="0001" then--1
sevenbit<="1001111";
elsif sw="0010" then--2
sevenbit<="0010010";
elsif sw="0011" then--3
sevenbit<="0000110";
elsif sw="0100" then--4
sevenbit<="1001100";
elsif sw="0101" then--5
sevenbit<="0100100";
elsif sw="0110" then--6
sevenbit<="0100000";
elsif  sw="0111" then--7
sevenbit<="0000111";
elsif  sw="1000" then--8
sevenbit<="0000000";
elsif sw="1001" then--9
sevenbit<="0000100";
else sevenbit<="0000000";
end if;
end process;

end Behavioral;


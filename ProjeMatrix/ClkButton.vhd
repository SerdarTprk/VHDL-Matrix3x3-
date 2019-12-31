----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:05:19 12/12/2019 
-- Design Name: 
-- Module Name:    ClkButton - Behavioral 
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

entity ClkButton is
    Port ( Din : in  STD_LOGIC;
           Clkin : in  STD_LOGIC;
           Qout : out  STD_LOGIC;
           rst : in  STD_LOGIC);
end ClkButton;

architecture Behavioral of ClkButton is
signal Q1, Q2, Q3 : std_logic;
begin
process(Clkin)
begin
   if (Clkin'event and Clkin = '1') then
      if (rst = '1') then
         Q1 <= '0';
         Q2 <= '0';
         Q3 <= '0'; 
      else
         Q1 <= Din;
         Q2 <= Q1;
         Q3 <= Q2;
      end if;
   end if;
end process;
 
Qout <= Q1 and Q2 and (not Q3);

end Behavioral;


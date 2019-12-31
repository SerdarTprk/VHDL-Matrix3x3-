----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:00:13 12/12/2019 
-- Design Name: 
-- Module Name:    ClkDivider - Behavioral 
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

entity ClkDivider is
    Port ( Clk : in  STD_LOGIC;
           ClkOut : out  STD_LOGIC;
           rst : in  STD_LOGIC);
end ClkDivider;

architecture Behavioral of ClkDivider is
signal clock:std_logic:='0';
signal count: integer range 0 to 1000000:=0;
begin
  process(Clk,rst,clock)
begin
   if (rst = '1') then
	clock<='0';
	count<=1;
   elsif (Clk'event and Clk = '1') then
   count<=count+1;
	if count=1000000 then
	clock<=not clock;
	count<=1;
   end if;
	end if;
	ClkOut<=clock;
end process;

end Behavioral;


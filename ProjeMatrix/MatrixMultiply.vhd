----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:11:37 12/12/2019 
-- Design Name: 
-- Module Name:    MatrixMultiply - Behavioral 
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


library work;
use work.MatrixType.all;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;
entity MatrixMultiply is
    Port ( 
           swin	   : in  STD_LOGIC_VECTOR (11 downto 0);--deðer giriþi(switch)
           sevseg : out  STD_LOGIC_VECTOR (0 to 6);--display
           an : out  STD_LOGIC_VECTOR (7 downto 0);--display active
           start : in  STD_LOGIC;--çarpma iþlemi için(switch)
           reset : in  STD_LOGIC;--(switch)
           xin : in  STD_LOGIC;--Deðer kaydetme(button)
           clk100mhz : in  STD_LOGIC;--clock
			  MATwrite:in STD_LOGIC--sonuc gösterme(switch)
			  );
end MatrixMultiply;

architecture Behavioral of MatrixMultiply is
component ClkButton port (Din : in  STD_LOGIC;
                          Clkin : in  STD_LOGIC;
								  Qout : out  STD_LOGIC;
								  rst : in  STD_LOGIC);								 
end component;
component ClkDivider port( Clk : in  STD_LOGIC;
									ClkOut : out  STD_LOGIC;
									rst : in  STD_LOGIC
									);
end component;
component sevendisplay Port(sw: in std_logic_vector(3 downto 0);
									sevenbit: out std_logic_vector(0 to 6)
							     	);
end component;
component ArrayIn Port( MatrixA : out  MatrixInt;
								MatrixB : out  MatrixInt;
								reset : in  STD_LOGIC;
								Clk : in  STD_LOGIC;
								disSeven1 : in  STD_LOGIC_VECTOR (0 to 6);
								disSeven2 : in  STD_LOGIC_VECTOR (0 to 6);
								disSeven3 : in  STD_LOGIC_VECTOR (0 to 6);
								Btn: in STD_LOGIC;
								RowName:out STD_LOGIC_VECTOR(0 to 13)
								);
end component;

component Multiply Port (      start : in  STD_LOGIC;
										 MatrixIn1 : in  MatrixInt;
										 MatrixIn2 : in  MatrixInt;
										 MatrixOuts : out  Matrix_3_3);
end component;
signal disSeven1: std_logic_vector(0 to 6);
signal disSeven2: std_logic_vector(0 to 6);
signal disSeven3: std_logic_vector(0 to 6);
signal refresh_counter: std_logic_vector(19 downto 0):=(others => '0');
signal activating_counter: std_logic_vector(2 downto 0);
signal MatrixA :  MatrixInt;
signal MatrixB :  MatrixInt;
signal ClkOut1:std_logic;
signal BtnOut:std_logic;
signal MatrixOuts:Matrix_3_3;
signal RowNames:std_logic_vector(0 to 13):=(others => '1');
begin
u1:sevendisplay port map(swin(3 downto 0),disSeven1);
u2:sevendisplay port map(swin(7 downto 4),disSeven2);
u3:sevendisplay port map(swin(11 downto 8),disSeven3);
cd:ClkDivider port map (clk100mhz,ClkOut1,reset);
cb:ClkButton port map (xin,ClkOut1,BtnOut,reset);
m1:ArrayIn port map(MatrixA,MatrixB,reset,clk100mhz,disSeven1,disSeven2,disSeven3,BtnOut,RowNames);
mp:Multiply port map(start,MatrixA,MatrixB,MatrixOuts);

process (MATwrite,activating_counter,disseven1,disseven2,disseven3,MatrixOuts,RowNames)
variable deneme:integer:=0;
begin
	if activating_counter   ="000" and MATwrite='0'  then
		an<="11111110";
		sevseg<=disSeven1;
	elsif activating_counter="001" and MATwrite='0' then
		an<="11111101";
		sevseg<=disSeven2;
	elsif activating_counter="010" and MATwrite='0' then
		an<="11111011";
		sevseg<=disSeven3;
	elsif activating_counter="011" and MATwrite='0' then
		an<="01111111";
		sevseg<=RowNames(0 to 6);
	elsif activating_counter="100" and MATwrite='0' then
		an<="10111111";
		sevseg<=RowNames(7 to 13);
	elsif activating_counter="000" and MATwrite='1' then
		an<="11111110";
		sevseg<=MatrixOuts(0,0);
	elsif activating_counter="001" and MATwrite='1' then
		an<="11111101";
		sevseg<=MatrixOuts(0,1);
	elsif activating_counter="010" and MATwrite='1' then
		an<="11111011";
		sevseg<=MatrixOuts(0,2);
	elsif activating_counter="011" and MATwrite='1' then
		an<="11110111";
		sevseg<=MatrixOuts(1,0);
	elsif activating_counter="100" and MATwrite='1' then
		an<="11101111";
		sevseg<=MatrixOuts(1,1);
	elsif activating_counter="101" and MATwrite='1' then
		an<="11011111";
		sevseg<=MatrixOuts(1,2);
	elsif activating_counter="110" and MATwrite='1' then
		an<="10111111";
		sevseg<=MatrixOuts(2,0);
	elsif activating_counter="111" and MATwrite='1' then
		an<="01111111";
		sevseg<=MatrixOuts(2,1);
	else 
		an<="11111111";
	   sevseg<=MatrixOuts(2,2);
 end if;

end process;

process(clk100mhz,reset)
begin 
    if(reset='1') then
        refresh_counter <= (others => '0');
    elsif(clk100mhz'Event and clk100mhz='1') then
        refresh_counter <= refresh_counter + 1;
    end if;
end process;
activating_counter<= refresh_counter(19 downto 17);

end Behavioral;


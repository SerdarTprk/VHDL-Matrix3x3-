----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:02:35 12/13/2019 
-- Design Name: 
-- Module Name:    Multiply - Behavioral 
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

library work;
use work.MatrixType.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Multiply is
    Port ( start : in  STD_LOGIC;
           MatrixIn1 : in  MatrixInt;
           MatrixIn2 : in  MatrixInt;
           MatrixOuts : out  Matrix_3_3
			  
			  );
end Multiply;

architecture Behavioral of Multiply is

function IntToDis (IntValue1 : integer) return std_logic_vector is
variable DisSeven1:std_logic_vector(0 to 6);
begin
if   IntValue1=0 then
DisSeven1:="0000001";
elsif IntValue1=1 then
DisSeven1:="1001111";
elsif IntValue1=2 then
DisSeven1:="0010010";
elsif IntValue1=3 then
DisSeven1:="0000110";
elsif IntValue1=4 then
DisSeven1:="1001100";
elsif IntValue1=5 then
DisSeven1:="0100100";
elsif IntValue1=6 then
DisSeven1:="0100000";
elsif IntValue1=7 then
DisSeven1:="0001111";
elsif IntValue1=8 then
DisSeven1:="0000000";
elsif IntValue1=9 then
DisSeven1:="0000100";
else 
DisSeven1:="0000000";
end if;
return DisSeven1;
end IntToDis;

begin

process(start,MatrixIn1,MatrixIn2)
variable matAB:MatrixInt;
variable MatrixOut: Matrix_3_3:= (others => (others => (others => '0')));
variable MatrixMult: std_logic_vector(0 to 6);
begin

if start='1' then

	matAB(0,0):=(MatrixIn1(0,0)*MatrixIn2(0,0))+(MatrixIn1(0,1)*MatrixIn2(1,0))+(MatrixIn1(0,2)*MatrixIn2(2,0));
	matAB(0,1):=(MatrixIn1(0,0)*MatrixIn2(0,1))+(MatrixIn1(0,1)*MatrixIn2(1,1))+(MatrixIn1(0,2)*MatrixIn2(2,1));
	matAB(0,2):=(MatrixIn1(0,0)*MatrixIn2(0,2))+(MatrixIn1(0,1)*MatrixIn2(1,2))+(MatrixIn1(0,2)*MatrixIn2(2,2));
	matAB(1,0):=(MatrixIn1(1,0)*MatrixIn2(0,0))+(MatrixIn1(1,1)*MatrixIn2(1,0))+(MatrixIn1(1,2)*MatrixIn2(2,0));
	matAB(1,1):=(MatrixIn1(1,0)*MatrixIn2(0,1))+(MatrixIn1(1,1)*MatrixIn2(1,1))+(MatrixIn1(1,2)*MatrixIn2(2,1));
	matAB(1,2):=(MatrixIn1(1,0)*MatrixIn2(0,2))+(MatrixIn1(1,1)*MatrixIn2(1,2))+(MatrixIn1(1,2)*MatrixIn2(2,2));
	matAB(2,0):=(MatrixIn1(2,0)*MatrixIn2(0,0))+(MatrixIn1(2,1)*MatrixIn2(1,0))+(MatrixIn1(2,2)*MatrixIn2(2,0));
	matAB(2,1):=(MatrixIn1(2,0)*MatrixIn2(0,1))+(MatrixIn1(2,1)*MatrixIn2(1,1))+(MatrixIn1(2,2)*MatrixIn2(2,1));
	matAB(2,2):=(MatrixIn1(2,0)*MatrixIn2(0,2))+(MatrixIn1(2,1)*MatrixIn2(1,2))+(MatrixIn1(2,2)*MatrixIn2(2,2));
	
	
   MatrixOut(0,0):=IntToDis(matAB(0,0));
	MatrixOut(0,1):=IntToDis(matAB(0,1));
	MatrixOut(0,2):=IntToDis(matAB(0,2));
	MatrixOut(1,0):=IntToDis(matAB(1,0));
	MatrixOut(1,1):=IntToDis(matAB(1,1));
	MatrixOut(1,2):=IntToDis(matAB(1,2));
	MatrixOut(2,0):=IntToDis(matAB(2,0));
	MatrixOut(2,1):=IntToDis(matAB(2,1));
	MatrixOut(2,2):=IntToDis(matAB(2,2));
	
	MatrixOuts<=MatrixOut;
else
MatrixOuts<= (others => (others => (others => '0')));
end if;
end process;
end Behavioral;


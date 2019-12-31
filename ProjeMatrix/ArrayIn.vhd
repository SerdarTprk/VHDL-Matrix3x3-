----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:26:37 12/13/2019 
-- Design Name: 
-- Module Name:    ArrayIn - Behavioral 
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

entity ArrayIn is
    Port ( 
			  MatrixA : out MatrixInt;
			  MatrixB : out MatrixInt;
           reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           disSeven1 : in  STD_LOGIC_VECTOR (0 to 6);
			  disSeven2 : in  STD_LOGIC_VECTOR (0 to 6);
			  disSeven3 : in  STD_LOGIC_VECTOR (0 to 6);
			  Btn:in STD_LOGIC;
			  RowName:out STD_LOGIC_VECTOR(0 to 13)
			  );
end ArrayIn;

architecture Behavioral of ArrayIn is
type state is (Row1a,Row1aa,Row2a,Row2aa,Row3a,Row3aa,Row1b,Row1bb,Row2b,Row2bb,Row3b,Row3bb);
signal Row: state;
signal Display1:integer;
signal Display2:integer;
signal Display3:integer;

function DisToInt(DisSeven:std_logic_vector(0 to 6)) return integer is
variable IntValue:integer;
begin
if DisSeven="0000001" then
IntValue:=0;
elsif DisSeven="1001111" then
IntValue:=1;
elsif DisSeven="0010010" then
IntValue:=2;
elsif DisSeven="0000110" then
IntValue:=3;
elsif DisSeven="1001100" then
IntValue:=4;
elsif DisSeven="0100100" then
IntValue:=5;
elsif DisSeven="0100000" then
IntValue:=6;
elsif DisSeven="0001111" then
IntValue:=7;
elsif DisSeven="0000000" then
IntValue:=8;
elsif DisSeven="0000100" then
IntValue:=9;
else 
IntValue:=1;
	end if;
return IntValue;
end DisToInt;
begin
Display1<=DisToInt(disSeven1);
Display2<=DisToInt(disSeven2);
Display3<=DisToInt(disSeven3);

process(Clk,reset)
variable c: integer:=0;
variable RowNameOut:STD_LOGIC_VECTOR(0 to 13):=(others => '1');
begin
	if(reset='1') then
	   RowNameOut:="11110011111111";
		RowName<=RowNameOut;
		Row<=Row1a;
		
	elsif (Clk 'Event and Clk='1') then
	case Row is
	   when Row1a=>
		if Btn='1' then
			MatrixA(0,0)<=Display1;
			MatrixA(0,1)<=Display2;
			MatrixA(0,2)<=Display3;
			RowNameOut:="10011110001000";
		   RowName<=RowNameOut;
			Row<=Row1aa; 
	    else Row<=Row1a; 
		end if;
		
		when Row1aa=>
		if Btn='1' then 
			Row<=Row1aa;
		else Row<=Row2a;
		end if;
		
		when Row2a=>
	   if Btn='1' then
			MatrixA(1,0)<=Display1;
			MatrixA(1,1)<=Display2;
			MatrixA(1,2)<=Display3;
			RowNameOut:="00100100001000";
		   RowName<=RowNameOut;
			Row<=Row2aa;
	   else Row<=Row2a;
		end if;	
		
		when Row2aa=>
		if Btn='1' then 
			Row<=Row2aa;
		else Row<=Row3a;
		end if;
		
		when Row3a=>
	   if Btn='1' then
			MatrixA(2,0)<=Display1;
			MatrixA(2,1)<=Display2;
			MatrixA(2,2)<=Display3;
			RowNameOut:="00001100001000";
		   RowName<=RowNameOut;
		
			Row<=Row3aa;
	   else Row<=Row3a;
		end if;
		
		when Row3aa=>
		if Btn='1' then 
			Row<=Row3aa;

		else Row<=Row1b;
		end if;
		
		when Row1b=>
	   if Btn='1' then
			MatrixB(0,0)<=Display1;
			MatrixB(0,1)<=Display2;
			MatrixB(0,2)<=Display3;
			Row<=Row1bb;
			RowNameOut:="10011110000000";
		   RowName<=RowNameOut;
		
	   else Row<=Row1b;
		end if;
		
		when Row1bb=>
		if Btn='1' then 
			Row<=Row1bb;
		else Row<=Row2b;
		end if;
		
		when Row2b=>
	   if Btn='1' then
			MatrixB(1,0)<=Display1;
			MatrixB(1,1)<=Display2;
			MatrixB(1,2)<=Display3;
			Row<=Row2bb;
			RowNameOut:="00100100000000";
		   RowName<=RowNameOut;
		
	   else Row<=Row2b;	
		end if;
		
		when Row2bb=>
		if Btn='1' then 
			Row<=Row2bb;
		else Row<=Row3b;
		end if;
		
		when Row3b=>
	   if Btn='1' then
			MatrixB(2,0)<=Display1;
			MatrixB(2,1)<=Display2;
			MatrixB(2,2)<=Display3;
			Row<=Row3bb;
			RowNameOut:="00001100000000";
		   RowName<=RowNameOut;
	
	   else Row<=Row3b;	
		end if;
		
		when Row3bb=>
		if Btn='1' then 
			Row<=Row3bb;
		else 
		Row<=Row1a;
		end if;
		when others=> c:=0;
	end case;
else c:=0;
end if;
end process;

end Behavioral;


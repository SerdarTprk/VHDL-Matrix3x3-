--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package MatrixType is
type Matrix_3_3 is array(2 downto 0,2 downto 0) of std_logic_vector(0 to 6);
type MatrixInt is array(2 downto 0,2 downto 0) of integer range 0 to 9;
end MatrixType;




package body MatrixType is

end MatrixType;

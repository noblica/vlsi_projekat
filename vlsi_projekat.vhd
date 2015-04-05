library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is port(
	clk: 									in std_logic;
	clear: 								in std_logic;
	add, sub:							in std_logic;
	andOp, xorOp, orOp, notOp: 	in std_logic;
	A, B: 								in std_logic_vector(7 downto 0);
	output: 								out std_logic_vector(7 downto 0));
end alu;

architecture aluArch of alu is
signal dReg: std_logic_vector(7 downto 0);
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if (clear = '1') then
				dReg <= (others => '0');
			elsif (add = '1') then
				dReg <= std_logic_vector(unsigned(A) + unsigned(B));
				--dReg <= (15 downto 8 => '0', 7 downto 0 => (std_logic_vector(unsigned(A) + unsigned(B)))); --posto se vektori ne mogu sabirati, moraju prvo da se konvertuju u unsigned
			elsif (sub = '1') then
				dReg <= std_logic_vector(unsigned(A) - unsigned(B));
				--dReg <= (15 downto 8 => '0', 7 downto 0 => std_logic_vector(unsigned(A) - unsigned(B)));
			--elsif (mul = '1') then
				--dReg <= std_logic_vector(unsigned(A) * unsigned(B));
			--elsif (div = '1') then
				--dReg <= (15 downto 4 => '0', 3 downto 0 => std_logic_vector(unsigned(A) / unsigned(B)));
			elsif (andOp = '1') then
				dReg <= A and B;
			elsif (orOp = '1') then
				dReg <= A or B;
			elsif (xorOp = '1') then
				dReg <= A xor B;
			elsif (notOp = '1') then
				dReg <= not A;
			end if;
		end if;
	end process;
	output <= dReg;
end aluArch;
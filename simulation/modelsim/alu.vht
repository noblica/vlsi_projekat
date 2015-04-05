LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;                                

ENTITY alu_vhd_tst IS
END alu_vhd_tst;
ARCHITECTURE alu_arch OF alu_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL add : STD_LOGIC;
SIGNAL andOp : STD_LOGIC;
SIGNAL B : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL clear : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL notOp : STD_LOGIC;
SIGNAL orOp : STD_LOGIC;
SIGNAL output : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL sub : STD_LOGIC;
SIGNAL xorOp : STD_LOGIC;

constant clk_period : time := 10 ns;

COMPONENT alu
	PORT (
	A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	add : IN STD_LOGIC;
	andOp : IN STD_LOGIC;
	B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	clear : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	notOp : IN STD_LOGIC;
	orOp : IN STD_LOGIC;
	output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	sub : IN STD_LOGIC;
	xorOp : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : alu
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	add => add,
	andOp => andOp,
	B => B,
	clear => clear,
	clk => clk,
	notOp => notOp,
	orOp => orOp,
	output => output,
	sub => sub,
	xorOp => xorOp
	);
clk_process : PROCESS
BEGIN
	loop
		clk <= '0'; wait for clk_period / 2;
		clk <= '1'; wait for clk_period / 2;
	end loop;
END PROCESS clk_process;
                                          
tb : PROCESS
BEGIN
	for i in 0 to 15 loop
		clear <= '1';
			wait for clk_period;
		clear <= '0'; add <= '1';
			A <= x"01"; B <= x"02"; wait for clk_period;
		wait until rising_edge(clk);
	end loop;
END PROCESS tb;                                          
END alu_arch;

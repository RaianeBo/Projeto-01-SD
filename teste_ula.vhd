LIBRARY ieee;

ENTITY teste_ula IS
END teste_ula;
 
ARCHITECTURE estrutura OF teste_ula IS 
 
 -- Component Declaration for the Unit Under Test (UUT)
 
COMPONENT ula IS PORT (
  X: IN BIT_VECTOR(3 DOWNTO 0);
  Y: IN BIT_VECTOR(3 DOWNTO 0);
  OP : IN BIT_VECTOR(2 DOWNTO 0);
  carry: OUT BIT; 
  S : OUT BIT_VECTOR(3 DOWNTO 0));
  
END COMPONENT;

 -- Inputs
 signal X : BIT_VECTOR(3 downto 0) := (others => '0');
 signal Y : BIT_VECTOR(3 downto 0) := (others => '0');
 signal OP : BIT_vector(2 downto 0) := (others => '0');

 -- Outputs
 signal S : BIT_VECTOR(3 downto 0);
 signal carry: BIT;
 --signal cout: STD_LOGIC;
 --signal zero: STD_LOGIC;
 --signal sinal: STD_LOGIC;
 
BEGIN
 
 -- Instantiate the Unit Under Test (UUT)
 uut: ula PORT MAP (
 x => x,
 y => y,
 s => s,
 carry => carry,
 OP => OP
 );

 -- Stimulus process
 stim_proc: process
 begin 
 -- hold reset state for 10 ns.
 wait for 10 ns; 

 -- insert stimulus here 

 X <= "1010";
 OP <= "111";
 
 Y <= "0000";
 wait for 10 ns;
 Y <= "0001";
 wait for 10 ns;
 Y <= "0010";
 wait for 10 ns;
 Y <= "0011";
 wait for 10 ns;
 Y <= "0100";
 wait for 10 ns;
 Y <= "0101";
 wait for 10 ns;
 Y <= "0110";
 wait for 10 ns;
 Y <= "0111";
 wait for 10 ns;
 Y <= "1000";
 wait for 10 ns;
 Y <= "1001";
 wait for 10 ns;
 Y <= "1010";
 wait for 10 ns;
 Y <= "1011";
 wait for 10 ns;
 Y <= "1100";
 wait for 10 ns;
 Y <= "1101";
 wait for 10 ns;
 Y <= "1110";
 wait for 10 ns;
 Y <= "1111";
 end process;

END;
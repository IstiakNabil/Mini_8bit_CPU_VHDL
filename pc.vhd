library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pc is
    Port (
        clk      : in  STD_LOGIC;
        reset    : in  STD_LOGIC;
        load_en  : in  STD_LOGIC;                    
        target   : in  STD_LOGIC_VECTOR(3 downto 0); 
        pc_out   : out STD_LOGIC_VECTOR(3 downto 0)
    );
end pc;
architecture Behavioral of pc is
    signal count : unsigned(3 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                count <= (others => '0');
            elsif load_en = '1' then
                count <= unsigned(target);
            else
                count <= count + 1;
            end if;
        end if;
    end process;
	 pc_out <= std_logic_vector(count);
end Behavioral;
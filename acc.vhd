library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity acc is
    Port (
        clk      : in  STD_LOGIC;
        reset    : in  STD_LOGIC;
        load_en  : in  STD_LOGIC;
        d_in     : in  STD_LOGIC_VECTOR(7 downto 0);
        q_out    : out STD_LOGIC_VECTOR(7 downto 0)
    );
end acc;

architecture Behavioral of acc is
    signal reg_data : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                reg_data <= (others => '0');
            elsif load_en = '1' then
                reg_data <= d_in;
            end if;
        end if;
    end process;
    
    q_out <= reg_data;
end Behavioral;
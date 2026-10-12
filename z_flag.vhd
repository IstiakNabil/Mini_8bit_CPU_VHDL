library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity z_flag is
    Port (
        clk      : in  STD_LOGIC;
        reset    : in  STD_LOGIC;
        load_en  : in  STD_LOGIC;
        z_in     : in  STD_LOGIC;
        z_out    : out STD_LOGIC
    );
end z_flag;
architecture Behavioral of z_flag is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                z_out <= '1'; -- Z flag becomes 1 on reset
            elsif load_en = '1' then
                z_out <= z_in;
            end if;
        end if;
    end process;
end Behavioral;
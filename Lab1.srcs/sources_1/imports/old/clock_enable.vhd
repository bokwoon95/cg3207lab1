--This module is to generate an enable signal for different display frequency based on pushbuttons
-- Fill in the blank to complete this module 
-- (c) Rajesh Panicker, ECE, NUS

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_enable is
  port(
    clk : in std_logic; -- fundamental clock 1MHz
    btnU : in std_logic; -- button BTNU for 4Hz speed
    btnC : in std_logic; -- button BTNC for pause
    enable : out std_logic -- output signal used to enable the reading of next memory data
    );
end clock_enable;

architecture behavioral of clock_enable is
  signal counter : std_logic_vector(19 downto 0) := x"00000";
begin
  process(clk)
    constant speed_one : std_logic_vector(19 downto 0) := x"F4240";
    constant speed_four : std_logic_vector(19 downto 0) := x"3D090";
  begin
    if rising_edge(clk) then
      if btnC = '1' then
        enable <= '0';
      else
        counter <= std_logic_vector(unsigned(counter) + 1);
        if (btnU = '1' and counter >= speed_one) or (btnU = '0' and counter >= speed_four) then
          enable <= '1';
          counter <= x"00000";
        else
          enable <= '0';
        end if;
      end if;
    end if;
  end process;
end behavioral;

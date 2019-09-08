library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_enable_tb is
end clock_enable_tb;

architecture behavioral of clock_enable_tb is
  component clock_enable
    port (
      clk : in std_logic;
      btnU : in std_logic;
      btnC : in std_logic;
      enable : out std_logic
    );
  end component;

  signal clk : std_logic := '1';
  signal btnU, btnC, enable : std_logic;
begin
  dut : clock_enable port map (
    clk => clk,
    btnU => btnU,
    btnC => btnC,
    enable => enable
  );

  process 
  begin
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
  end process;

  process
  begin
    btnC <= '1';
    btnU <= '1';
    wait for 40 ns;
    btnC <= '0';
    btnU <= '0';
    wait for 40 ns;
    btnC <= '0';
    btnU <= '1';
    wait for 40 ns;
    wait;
  end process;
end behavioral;

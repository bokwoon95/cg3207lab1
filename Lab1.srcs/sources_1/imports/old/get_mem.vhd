-- This module should contain the corresponding Memory data generated from Hex2ROM
-- and choose the memory data to be displayed based on enable signal  
-- Fill in the blank to complete this module 
-- (c) Rajesh Panicker, ECE, NUS

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity get_mem is
  port ( 
    clk : in std_logic; -- fundamental clock 100mhz
    enable : in std_logic; -- enable signal to read the next content
    data : out std_logic_vector(31 downto 0); -- 32 bits memory contents for 7-segments display
    upper_lower : out std_logic -- 1-bit signal rerequied for leds, indicating which half of the memory data is displaying on leds
  );
end get_mem;

architecture behavioral of get_mem is
  -- declare address for instr_mem and data_const_mem
  signal addr : std_logic_vector(8 downto 0) := (others => '0');

  -- declare instr_mem and data_const_mem
  type mem_128x32 is array (0 to 127) of std_logic_vector (31 downto 0);

  -- declare read from instr (0) or data (1)
  signal instr_or_data : std_logic := '0';

  -- declare 9 bit counter
  signal nine_bit_counter : std_logic_vector (8 downto 0) := (others => '0');

----------------------------------------------------------------
-- instruction memory
----------------------------------------------------------------
  constant instr_mem : mem_128x32 := (
    x"e59f11f8",
    x"e59f21f8",
    x"e59f3200",
    x"e5924000",
    x"e5814000",
    x"e2533001",
    x"1afffffd",
    x"e59f31ec",
    x"eafffffe",
    others => x"00000000"
  );

----------------------------------------------------------------
-- data (constant) memory
----------------------------------------------------------------
  constant data_const_mem : mem_128x32 := (
    x"00000c00",
    x"00000c04",
    x"00000c08",
    x"00000c0c",
    x"00000004",
    x"00000800",
    x"abcd1234",
    x"6c6c6548",
    x"6f57206f",
    x"21646c72",
    x"00212121",
    others => x"00000000"
  );


begin
  -- determine upper_lower by corresponding input
  upper_lower <= nine_bit_counter(0);

  -- determine corresponding memory data that should be displayed on 7-segments
  process(clk)
  begin
    if rising_edge(clk) then
      if nine_bit_counter(8) = '1' then
        data <= instr_mem(to_integer(unsigned(addr)));
      else
        data <= data_const_mem(to_integer(unsigned(addr)));
      end if;
    end if;
  end process;

  -- determine memory index "addr" accordingly
  addr <= nine_bit_counter(7 downto 1);

  -- 9-bit counter
  process(clk)
  begin
    if rising_edge(clk) and enable = '1' then
      nine_bit_counter <= std_logic_vector(unsigned(nine_bit_counter) + 1);
    end if;
  end process;

end behavioral;

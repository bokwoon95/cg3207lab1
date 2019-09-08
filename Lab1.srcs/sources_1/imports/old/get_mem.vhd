-- This module should contain the corresponding Memory data generated from Hex2ROM
-- and choose the memory data to be displayed based on enable signal  
-- Fill in the blank to complete this module 
-- (c) Rajesh Panicker, ECE, NUS

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity Get_MEM is
  -- fundamental clock 100MHz
  -- enable signal to read the next content
  -- 32 bits memory contents for 7-segments display
  -- 1-bit signal rerequied for LEDs, indicating which half of the Memory data is displaying on LEDs
  Port ( 
    clk : in std_logic;
    enable : in std_logic;
    data : out std_logic_vector(31 downto 0);
    upper_lower : out std_logic
    );
end Get_MEM;

architecture Behavioral of Get_MEM is
  -- declare address for INSTR_MEM and DATA_CONST_MEM
  signal addr : std_logic_vector(8 downto 0) := (others => '0');

  -- declare INSTR_MEM and DATA_CONST_MEM
  type MEM_128x32 is array (0 to 127) of std_logic_vector (31 downto 0);
  constant INSTR_MEM : MEM_128x32 := (
    x"E59F11F8",
    x"E59F21F8",
    x"E59F3200",
    x"E5924000",
    x"E5814000",
    x"E2533001",
    x"1AFFFFFD",
    x"E59F31EC",
    x"EAFFFFFE",
    others => x"00000000"
  );
  constant DATA_CONST_MEM : MEM_128x32 := (
    x"00000C00",
    x"00000C04",
    x"00000C08",
    x"00000C0C",
    x"00000004",
    x"00000800",
    x"ABCD1234",
    x"6C6C6548",
    x"6F57206F",
    x"21646C72",
    x"00212121",
    others => x"00000000"
  );

----------------------------------------------------------------
-- Instruction Memory
----------------------------------------------------------------









----------------------------------------------------------------
-- Data (Constant) Memory
----------------------------------------------------------------









begin

  -- determine upper_lower by corresponding input


  -- determine corresponding memory data that should be displayed on 7-segments



  -- determine memory index "addr" accordingly
  process(clk)
  begin





  end process;

end Behavioral;

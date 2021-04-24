defmodule RomanNumerals do
  @roman_to_arabic [
    {"M", 1_000},
    {"CM", 900},
    {"D", 500},
    {"CD", 400},
    {"C", 100},
    {"XC", 90},
    {"L", 50},
    {"XL", 40},
    {"X", 10},
    {"IX", 9},
    {"V", 5},
    {"IV", 4},
    {"I", 1}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(0), do: ""

  def numeral(number) do
    {roman, arabic} = Enum.find(@roman_to_arabic, fn {_roman, arabic} -> number >= arabic end)

    roman <> numeral(number - arabic)  
  end

end

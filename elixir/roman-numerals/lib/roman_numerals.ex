defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number), do: numeralize(number)

  defp numeralize(0), do: ""
  defp numeralize(number) when number >= 1000, do: "M" <> numeralize(number - 1000)
  defp numeralize(number) when number >= 900, do: "CM" <> numeralize(number - 900)
  defp numeralize(number) when number >= 500, do: "D" <> numeralize(number - 500)
  defp numeralize(number) when number >= 400, do: "CD" <> numeralize(number - 400)
  defp numeralize(number) when number >= 100, do: "C" <> numeralize(number - 100)
  defp numeralize(number) when number >= 90, do: "XC" <> numeralize(number - 90)
  defp numeralize(number) when number >= 50, do: "L" <> numeralize(number - 50)
  defp numeralize(number) when number >= 40, do: "XL" <> numeralize(number - 40)
  defp numeralize(number) when number >= 10, do: "X" <> numeralize(number - 10)
  defp numeralize(number) when number == 9, do: "IX" <> numeralize(number - 9)
  defp numeralize(number) when number >= 5, do: "V" <> numeralize(number - 5)
  defp numeralize(number) when number == 4, do: "IV" <> numeralize(number - 4) 
  defp numeralize(number) when number < 4, do: "I" <> numeralize(number - 1)
end

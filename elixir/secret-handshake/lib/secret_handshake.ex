defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    masks_actions = %{
      0b1 => &(&1 ++ ["wink"]),
      0b10 => &(&1 ++ ["double blink"]),
      0b100 => &(&1 ++ ["close your eyes"]),
      0b1000 => &(&1 ++ ["jump"]),
      0b10000 => &(Enum.reverse(&1))
    }

    Enum.reduce(masks_actions, [], &decypher(&1, &2, code))
  end

  defp decypher({mask, action}, acc, code) do
    if bit_set(code, mask), do: action.(acc), else: acc
  end
  defp bit_set(code, mask), do: Bitwise.band(code, mask) != 0
end

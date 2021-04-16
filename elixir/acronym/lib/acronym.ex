defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.scan(~r/(?<![A-Z])[A-Z]|(?<!\')\b[a-z]/, string)
    |> List.flatten
    |> Enum.map(&String.upcase/1)
    |> Enum.join
  end
end

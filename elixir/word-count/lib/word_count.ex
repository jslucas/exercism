defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    Regex.scan(~r/(?:\p{L}|[a-zA-Z0-9]|-)+/u, sentence)
    |> List.flatten
    |> Enum.map(&String.downcase/1)
    |> Enum.reduce(%{}, &to_word_map/2)
  end

  defp to_word_map(word, acc) do
    Map.update(acc, word, 1, &(&1 + 1))
  end
end

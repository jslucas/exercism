defmodule RnaTranscriptionTailRecursive do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) when is_list(dna), do: to_rna(dna, '')

  defp to_rna([], acc), do: acc
  defp to_rna('G' ++ tail, acc), do: to_rna(tail, acc ++ 'C')
  defp to_rna('C' ++ tail, acc), do: to_rna(tail, acc ++ 'G')
  defp to_rna('T' ++ tail, acc), do: to_rna(tail, acc ++ 'A')
  defp to_rna('A' ++ tail, acc), do: to_rna(tail, acc ++ 'U')
end

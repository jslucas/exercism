defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """

  ###
  #  charlists are just lists of integers with valid code points for chars
  #  which is why you need to pattern match against a char literal with ?
  ###
  @spec to_rna([char]) :: [char]
  def to_rna(?G), do: ?C
  def to_rna(?C), do: ?G
  def to_rna(?T), do: ?A
  def to_rna(?A), do: ?U
  def to_rna(dna) when is_list(dna), do: Enum.map(dna, &to_rna/1)
end

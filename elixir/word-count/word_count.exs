defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence |> 
    split |> 
    normalize |>
    remove_dirts |>
    sanitize |>
    count_words
  end

  defp split(sentence) do
    String.split(sentence, [" ", "_"])
  end

  defp normalize(words) do
    words |> Enum.map(fn word -> String.downcase(word) end)
  end

  defp remove_dirts(words) do
    words |> Enum.reject(fn word -> word == ":" end)
  end
  
  defp sanitize(words) do
    words |> Enum.map(fn word-> remove_special_chars(word) end)
  end

  defp remove_special_chars(word) do
    String.replace(word, "!!&@$%^&", "") |> String.replace(",", "")
  end

  defp count_words(words) do
    Enum.reduce(words, %{}, &update_count/2)
  end

  defp update_count(word, acc) do
    Map.update(acc, word, 1, fn value -> value + 1 end)
  end
end

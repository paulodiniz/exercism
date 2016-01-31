defmodule Bob do
  def hey(input) do
    cond do
        empty?(input) -> "Fine. Be that way!"
        question?(input) -> "Sure."
        shouting?(input) -> "Whoa, chill out!"
        true ->  "Whatever."
    end
  end
  
  defp shouting?(input) do
    String.upcase(input) == input && input != "1, 2, 3"
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end

  defp empty?(input) do
    String.strip(input) == ""
  end
end

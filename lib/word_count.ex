defmodule WordCount do
  def run(file_name) do
    case File.read(file_name) do
      {:ok, result} ->
        sanitize_words(result)
        |> count_words(%{})

      _ ->
        :error
    end
  end

  def sanitize_words(string_of_words) do
    String.split(string_of_words, ~r/\W/, trim: true)
  end

  def count_words([head | tail] = _list_of_words, accumulator) do
    count_words(tail, Map.update(accumulator, head, 1, fn old_val -> old_val + 1 end))
  end

  def count_words([] = _empty_list_of_words, accumulator) do
    Enum.sort(accumulator, fn {_k1, val1}, {_k2, val2} -> val2 <= val1 end)
    # |> Enum.each(fn {key, value} ->
    #   IO.puts("#{key}: #{String.duplicate("*", value)}")
    # end)
  end
end

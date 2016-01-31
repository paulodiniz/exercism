defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0 
  def count([_| tail]), do: 1 + count(tail)

  @spec reverse(list) :: list
  def reverse(list) do
    _reverse(list, [])
  end

  defp _reverse([], acc), do: acc
  defp _reverse([head| tail], acc) do
    _reverse(tail, [head | acc]) 
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    _map(l, f)
  end

  defp _map([], f), do: [] 
  defp _map([head|tail], f) do
    [f.(head) | _map(tail, f)]
  end


  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    _filter(l, f)
  end

  defp _filter([], f), do: []
  defp _filter([head|tail], f) do
    case f.(head) do
      true  -> [head | _filter(tail, f)] 
      false -> _filter(tail, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    _reduce(l, acc, f)
  end

  defp _reduce([], acc, f), do: acc
  defp _reduce([head|tail], acc, f) do
    _reduce(tail, f.(head, acc), f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    _append(a, b)
  end
  
  defp _append([], []), do: []
  defp _append([], list), do: list
  defp _append(list, []), do: list
  defp _append([h|t], list) do 
    [h | _append(t, list)]
  end

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([h|t]) do
    append(h, concat(t))
  end
end

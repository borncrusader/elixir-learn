defmodule NinetyNineProbs.List01 do
  @moduledoc """
  Documentation for Ninety Nine Problems
  """

  @doc """
  Finds last element in the list
  
  ## Examples

      iex> NinetyNineProbs.List01.findLast([])
      :error
      iex> NinetyNineProbs.List01.findLast([1])
      1
      iex> NinetyNineProbs.List01.findLast([1, 2, 3])
      3
  """
  def findLast(list) do
      case list do
        [] -> :error
        [tail] -> tail
        [_head | tail] -> findLast(tail)
      end
  end

  @doc """
  Finds last but one element in the list
  
  ## Examples

      iex> NinetyNineProbs.List01.findLastButOne([])
      :error
      iex> NinetyNineProbs.List01.findLastButOne([1])
      :error
      iex> NinetyNineProbs.List01.findLastButOne([1, 2])
      1
      iex> NinetyNineProbs.List01.findLastButOne([1, 2, 3, 4, 5])
      4
  """
  def findLastButOne(list) do
      case list do
        [] -> :error
        [_tail] -> :error
        [tail_1, _tail_2] -> tail_1
        [_head | tail] -> findLast(tail)
      end
  end
end

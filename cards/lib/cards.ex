defmodule Cards do
  @moduledoc """
    Documentation for Cards.
  """
  @doc """
    Creates a deck of cards

  ## Examples

      iex> deck = Cards.create_deck
      iex> length(deck)
      52
  """
  def create_deck do
    values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    suites = ["S", "H", "C", "D"]

    for suit <- suites, val <- values do
      "#{val}:#{suit}"
    end
  end

  @doc """
    Shuffles the `deck` of cards provided
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Checks if the given `card` is in the `deck`

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "5:H")
      true
      iex> Cards.contains?(deck, "11:C")
      false
  """
  def contains?(deck, card) do
    # ? in the name is a convention for methods that return a boolean
    Enum.member?(deck, card)
  end

  @doc """
    Deals a set of cards of `hand_size` from the `deck`
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saves the `deck` of cards to the `filename` with default compression settings
  """
  def save(deck, filename) do
    bin = :erlang.term_to_binary(deck, [:compressed])
    File.write(filename, bin)
  end

  @doc """
    Loads a deck of cards from `filename`
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, bin} -> :erlang.binary_to_term(bin)
      {:error, _reason} -> "The file does not exist!"
    end
  end

  @doc """
    Create a hand - essentially creates a deck, shuffles the deck and deals `hand_size` worth of cards
  """
  def create_hand(hand_size) do
    Cards.create_deck |> Cards.shuffle |> Cards.deal(hand_size)
  end
end

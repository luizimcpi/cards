defmodule Cards do

  @moduledoc """
    Providers methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings represents a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
  
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contains a given card

    ## Examples

        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck, "Ace of Spades")
        true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  #Return tuple -> {hand, rest_of_deck} = Cards.deal(deck, 5)
  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The 'hand_size' indicates how many cards should 
    be in the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
      
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
  
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do

    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist" #with underscore we ignore the variable reason at compile and execution time
    end

  end

  def create_hand(hand_size) do
    #without pipe operator
    #deck = Cards.create_deck
    #deck = Cards.shuffle(deck)
    #hand = Cards.deal(deck, hand_size)
    #using pipe operator
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end

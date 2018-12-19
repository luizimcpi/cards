defmodule Cards do
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

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  #Return tuple -> {hand, rest_of_deck} = Cards.deal(deck, 5)
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

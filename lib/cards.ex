defmodule Cards do
  def create_deck do
    values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    suits = ["♠", "♥", "♦", "♣"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle_deck(deck) do
    Enum.shuffle(deck)
  end

  def deal(deck, hand_size) do
    {hand, rest_of_deck} = Enum.split(deck, hand_size)
    {hand, rest_of_deck}
  end

  def save_deck(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load_deck(filename) do
    # pattern matching
    {status, binary} = File.read(filename)
    # error handling
    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "That file doesn't exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck()
    # |> is the pipe operator, it passes the result of the previous function to the next as the first argument
    |> Cards.shuffle_deck()
    |> Cards.deal(hand_size)
  end
end

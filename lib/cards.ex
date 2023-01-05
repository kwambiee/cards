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
end

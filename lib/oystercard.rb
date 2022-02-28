class Oystercard
  attr_reader :balance
  LIMIT = 90
  EXCEEDS_MESSAGE = "Denied. Balance would exceed #{LIMIT}"

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise EXCEEDS_MESSAGE if exceeds?(amount)
    @balance += amount
  end

  def exceeds?(amount)
    @balance + amount > LIMIT
  end

end
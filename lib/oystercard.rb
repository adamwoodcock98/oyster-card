class Oystercard
  attr_reader :balance
  attr_accessor :in_use
  LIMIT = 90
  EXCEEDS_MESSAGE = "Denied. Balance would exceed #{LIMIT}"

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    raise EXCEEDS_MESSAGE if exceeds?(amount)
    @balance += amount
  end

  def exceeds?(amount)
    @balance + amount > LIMIT
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    @in_use
  end

end
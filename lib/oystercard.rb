class Oystercard
  attr_reader :balance
  attr_reader :entry_station
  LIMIT = 90
  EXCEEDS_MESSAGE = "Denied. Balance would exceed #{LIMIT}"
  MINIMUM_FARE = 1

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

  def touch_in(station)
    raise 'insufficient funds' if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
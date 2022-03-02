require_relative 'journey'

class Oystercard
  
  attr_reader :balance
  attr_reader :all_journeys
  attr_accessor :current_journey
  LIMIT = 90
  EXCEEDS_MESSAGE = "Denied. Balance would exceed #{LIMIT}"
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @all_journeys = []
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
    @current_journey = Journey.new
    @current_journey.start_journey(station)
  end

  def touch_out(station)
    @current_journey = Journey.new if current_journey == nil
    @current_journey.end_journey(station)
    deduct(@current_journey.calculate_fare_or_penalty)
    store_journey
  end

  def in_journey?
    @current_journey != nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def store_journey
    @all_journeys << @current_journey
    @current_journey = nil
  end

end
class Journey
  attr_reader :entry_station
  attr_reader :exit_station

  def initialize
  end

  def start_journey(station)
    @entry_station = station
  end

  def end_journey(station)
    @exit_station = station
  end

  def calculate_fare_or_penalty
    return 1 if complete?
    return 6
  end

  def complete?
    @entry_station != nil && @exit_station != nil
  end

end
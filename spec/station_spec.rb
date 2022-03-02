require 'station.rb'

describe Station do

  before do
    @holborn = :holborn
    @zone = 2
  end

  it 'should have a station name' do 
    station = Station.new(@holborn, @zone)
    expect(station.name).to be @holborn
  end

  it 'should have a zone' do 
    station = Station.new(@holborn, @zone)
    expect(station.zone).to be @zone
  end
end

require 'oystercard.rb'

describe Oystercard do

  it 'should have a balance of 0 by default' do
    expect(subject.balance).to eq(0)
  end

  it 'should have a top-up method that takes one argument' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end 
end
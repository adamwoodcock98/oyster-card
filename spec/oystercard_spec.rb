require 'oystercard.rb'

describe Oystercard do

  it 'should have a balance of 0 by default' do
    expect(subject.balance).to eq(0)
  end

  it 'should have a top-up method that takes one argument' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end 

  it 'should increase balance by specified amount' do 
    subject.top_up(10)
    expect(subject.balance).to eq(10) #balance is returnd, this is what we are testing
  end

  it 'should raise error if balance would exceed £90' do
    subject.top_up(Oystercard::LIMIT)
    expect { subject.top_up(1) }.to raise_error "Denied. Balance would exceed #{Oystercard::LIMIT}"
  end

end
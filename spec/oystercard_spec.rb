require 'oystercard.rb'

describe Oystercard do

  context 'balance tests'do 

    it 'should have a balance of 0 by default' do
      expect(subject.balance).to eq(0)
    end

    it 'should have a top-up method that takes one argument' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end 

    it 'should increase balance by specified amount' do 
      subject.top_up(10)
      expect(subject.balance).to eq(10) #balance is returned, this is what we are testing
    end

    it 'should raise error if balance would exceed £90' do
      subject.top_up(Oystercard::LIMIT)
      expect { subject.top_up(1) }.to raise_error Oystercard::EXCEEDS_MESSAGE
    end

    it 'should have a deduct method that takes one argument' do 
      expect(subject).to respond_to(:deduct).with(1).argument
    end

    it 'should deduct the fare from my balance' do 
      subject.top_up(10)
      subject.deduct(5)
      expect(subject.balance).to eq(5)
    end

  end

  context 'touch in / touch out support tests' do

    it 'should have an instance variable, in_use' do
      expect(subject.in_use).to eq false
    end

    it 'should be able to touch in and change in_use to true' do
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'should be able to touch and change in_use to false' do
      subject.touch_in
      subject.touch_out
      expect(subject).to_not be_in_journey
    end

  end
end
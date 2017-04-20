require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  describe '#balance' do
    it 'Should return 0 balance' do
      expect(oystercard.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it 'Expects #top_up to change balance' do
      expect { oystercard.top_up(10) }.to change { oystercard.balance }.by(10)
    end

    it 'Should raise error if top up breaches limit' do
      max_balance = Oystercard::MAX_BALANCE
      oystercard.top_up(max_balance)
      expect { oystercard.top_up(1) }.to raise_error "Top-up over max balance £#{max_balance}"
    end
  end

  describe '#in_journey?' do
    it 'Expects #in_journey to return false' do
      expect(oystercard.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    it 'changes #in_journey? to true' do
      oystercard.top_up(20)
      expect { oystercard.touch_in }.to change { oystercard.in_journey? }.to true
    end
    it '#touch_in when already travelling raises error' do
      oystercard.top_up(10)
      oystercard.touch_in
      expect { oystercard.touch_in }.to raise_error 'Already travelling'
    end
    it 'updates @origin with the current station' do
      station = :waterloo
      expect(oystercard).to receive(:origin).and_return(station)
      oystercard.top_up(10)
      oystercard.touch_in(station)
      expect(oystercard.origin).to eq station
    end
      context 'low_balance' do
        it 'Raises an error' do
          low_balance = Oystercard::LOW_BALANCE
          oystercard.top_up(low_balance - 1)
          expect { oystercard.touch_in }.to raise_error 'Not enough funds'
        end
      end
  end

  describe '#touch_out' do
    it 'changes #in_journey to false' do
      oystercard.top_up(10)
      oystercard.touch_in
      expect { oystercard.touch_out }.to change { oystercard.in_journey? }.to false
    end
    it 'raises error if touch_out when not in journey' do
      expect { oystercard.touch_out }.to raise_error 'ERROR! Not travelling!'
    end

      context "change balance" do
        it "deducts fare" do
          oystercard.top_up(20)
          oystercard.touch_in
          expect { oystercard.touch_out }.to change {oystercard.balance }.by -Oystercard::FARE
        end
      end
  end

  describe '#origin' do
    it { is_expected.to respond_to :origin }
    it ''
  end
end

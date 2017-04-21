require 'station'

describe Station do
	subject(:station) { described_class.new }

	it { is_expected.to respond_to(:zone).with(1).argument}

  describe '#zone' do
		let(:station_name){ double :station_name }
    it 'raises an error if station does not exist' do
    	station.zone(:station_name)
			expect { :station_name != :stations }.to raise_error 'Station does not exist'
    end
  end

end

require 'station'

describe Station do
  subject { described_class.new(station_name: "Waterloo", zone: 1) }

	# describe '#new' do
	# 	it 'takes 2 arguments' do
	# 		expect(Station).to respond_to(:new).with(2).arguments
	# 	end

	describe '#station_name' do
		it 'returns the #zone' do
			subject.station_name
      expect(subject.zone).to_not be_nil
		end
	end
 # end
end

require 'station'

describe Station do
	# subject(:station) { described_class.new }

	it { is_expected.to respond_to(:zone).with(1).argument}

  # describe '#zone' do
  #   it ''
  # end

end

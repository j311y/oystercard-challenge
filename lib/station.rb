
class Station

	attr_reader :station_name, :zone

  @stations = {:staion_name => :Waterloo, :zone => 1}#	, {station_name: :Paddington => zone: 2}

	def initialize(station_name)
		@station_name = station_name
		@zone = zone
  end

end

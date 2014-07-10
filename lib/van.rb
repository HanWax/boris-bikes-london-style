require_relative 'bike_container'

class Van

	include BikeContainer

	def collect(bikes)
		bikes.select { |bike| bike.broken? }
	end
end
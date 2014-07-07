class Station

	def initialize
		@station_bikes = []

	end

	def station_bikes
		@station_bikes
	end

	def receive! (bike)
		station_bikes << bike
	end

	def release!
		station_bikes.pop
		station_bikes
	end

end
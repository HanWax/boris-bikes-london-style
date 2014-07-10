module BikeContainer

	DEFAULT_CAPACITY = 20

	def initialize(capacity: DEFAULT_CAPACITY)
		@capacity = capacity
	end

	def bikes
		@bikes ||= []
	end

	def dock(bike)
		raise 'Too many borises' if full? 
		bikes << bike 
	end

	def release(bike)
		bikes.delete(bike)
	end

	def full?
		bikes.count == 20
	end

	def capacity
		DEFAULT_CAPACITY
	end

	def available_bikes
		bikes.reject { |bike| bike.broken? }
	end

	def broken_bikes
		bikes.select { |bike| bike.broken? }
	end

end


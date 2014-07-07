class User

	def initialize
		@user_bikes = []
	end

	def user_bikes
		@user_bikes
	end

	def checkout! (station)
		@user_bikes << station.pop
		self
	end

	def return!(station)
		station.receive!(user_bikes.pop)		
		self
	end
end
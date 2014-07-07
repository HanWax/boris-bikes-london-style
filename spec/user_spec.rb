require 'user'
require'bike'
require 'station'


describe User do
let(:bike1) {Bike.new}
let(:user) {User.new}
let(:station) {Station.new}
let(:non_empty_station) {Station.new.receive!(bike1)}

	it 'does not have a bike when created' do
		expect(user.user_bikes).to eq []
	end

	it 'can take a bike' do 
		station.receive!(bike1)
		user.checkout!(non_empty_station)
		expect(user.user_bikes).to eq [bike1]
	end

	it 'can return a bike to a station' do
		user.checkout!(non_empty_station)
		user.return!(station)
		expect(user.user_bikes).to eq []
	end

	it 'can take a bike from a station' do 
		user.checkout!(non_empty_station)

	end
end 
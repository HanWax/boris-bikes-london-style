require 'bike'
require 'station'
require 'user'

describe Station do 

let(:station) {Station.new}
let(:bike1) {Bike.new}
let(:bike2) {Bike.new}
let(:non_empty_station) {Station.new.receive!(bike1)}
	
	it 'has no bikes in dock when created' do 
		expect(station.station_bikes.empty?).to be true
	end

	it 'can receive a bike' do
		station.receive!(bike1)
		expect(station.station_bikes).to eq [bike1]
	end

	it 'can receive a second bike' do
		station.receive!(bike1)
		station.receive!(bike2)
		expect(station.station_bikes).to eq [bike1, bike2]	
	end

	it 'can release a bike if it is not empty' do
		station.receive!(bike1) 
		station.receive!(bike2)
		station.release!
		expect(station.station_bikes.count).to eq 1 	  
	end

	it 'holds a bike that has been returned by the user' do
		user = User.new.checkout!(non_empty_station)
		user.return!(station)
		expect(station.station_bikes). to include bike1
	end	
		
end
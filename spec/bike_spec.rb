require 'bike'

describe Bike do

let(:bike1) {Bike.new}

	it 'is not broken when it is created' do 
		expect(bike1.broken?).to be false 
	end

	it 'can be broken' do
		bike1.break!
		expect(bike1.broken?).to be true
	end

	it 'can be fixed' do 
		bike1.fix!
		expect(bike1.broken?).to be false
	end
end

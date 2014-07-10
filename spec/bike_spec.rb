require 'bike'

describe Bike do 
	let(:boris) {Bike.new}

	it 'is not broken when it is created' do
		expect(boris).not_to be_broken
	end

	it 'can be broken' do
		boris.break!
		expect(boris).to be_broken
	end

	it 'can be fixed' do
		boris.break! 
		boris.fix!
		expect(boris).not_to be_broken
	end

end
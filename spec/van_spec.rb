require 'bike_container_spec'
require 'van'

describe Van do

	let(:van) { Van.new }
	let(:boris) { double :bike, broken?: false }
	let(:dave) { double :bike, broken?: true }
	let(:bikes) { [boris, dave] }

	it_behaves_like 'a bike container' 

	it 'should only pick up broken bikes' do
		expect(van.collect(bikes)).to eq [dave]
	end
end
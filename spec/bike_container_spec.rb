require './lib/bike_container'

shared_examples 'a bike container' do
	
	let(:parliament) { described_class.new(:capacity => 30) }
	let(:boris) { double :bike, broken?: false }
	let(:dave) { double :bike, broken?: true }
	let(:default_capacity) { parliament::DEFAULT_CAPACITY }


	it "should initialize with a set capacity" do
		expect(parliament.capacity).to eq default_capacity
	end

	it 'should be empty when created' do
		expect(parliament.bikes).to be_empty
	end 

	it 'should accept a boris' do
		parliament.dock(boris)
		expect(parliament.bikes).to eq([boris])
	end

	it 'should release a boris' do
		parliament.dock(boris)
		parliament.release(boris)
		expect(parliament.bikes).to be_empty
	end

	it 'should know just how many borises it can take' do
		default_capacity.times{parliament.dock(boris)}
		expect(parliament).to be_full
	end

	it 'should not accept another boris when full' do
		default_capacity.times{parliament.dock(boris)}
		expect{ parliament.dock(boris) }.to raise_error(RuntimeError)
	end

	it 'should know which borises are available' do
		parliament.dock(boris)
		parliament.dock(dave)
		expect(parliament.available_bikes).to eq [boris]
	end

	it 'should know which borises are broken & emotionally bruised' do
		parliament.dock(boris)
		parliament.dock(dave)
		expect(parliament.broken_bikes).to eq [dave]
	end

end
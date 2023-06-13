require './lib/ride'
require './lib/visitor'
require './lib/carnival'

RSpec.describe Carnival do
  it "exists" do
    carnival = Carnival.new(10)
    expect(carnival).to be_a(Carnival)
  end

  it "has a duration and an array of rides" do
    carnival = Carnival.new(10)
    expect(carnival.duration).to eq(10)
    expect(carnival.rides).to eq([])
  end

  it "can add rides to an array" do
    carnival = Carnival.new(10)
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })

    carnival.add_ride(ride1)
    carnival.add_ride(ride2)

    expect(carnival.rides).to eq([ride1, ride2])
  end
end
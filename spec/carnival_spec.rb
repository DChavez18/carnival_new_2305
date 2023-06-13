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

  it "has a most popular ride" do
    carnival = Carnival.new(10)
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')

    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    visitor2.add_preference(:thrilling)
    visitor3.add_preference(:thrilling)

    carnival.add_ride(ride1)
    carnival.add_ride(ride2)

    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride2.board_rider(visitor3)

    expect(carnival.most_popular_ride).to eq(ride1)
  end

  it "has a most profitable ride" do
    carnival = Carnival.new(10)
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')

    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    visitor2.add_preference(:thrilling)
    visitor3.add_preference(:thrilling)
    visitor3.add_preference(:gentle)

    carnival.add_ride(ride1)
    carnival.add_ride(ride2)

    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride2.board_rider(visitor3)

    expect(carnival.most_profitable_ride).to eq(ride2)
  end

  it "can calculate total revenue of all of its rides" do
    carnival = Carnival.new(10)
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')

    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    visitor2.add_preference(:thrilling)
    visitor3.add_preference(:thrilling)
    visitor3.add_preference(:gentle)

    carnival.add_ride(ride1)
    carnival.add_ride(ride2)

    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride2.board_rider(visitor3)

    expect(carnival.total_revenue).to eq(0)
  end
end
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
end
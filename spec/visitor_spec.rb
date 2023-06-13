require './lib/visitor'

RSpec.describe Visitor do

  it "exists" do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    expect(visitor1).to be_a(Visitor)
  end

  it "has attributes" do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    expect(visitor1.name).to eq("Bruce")
    expect(visitor1.height).to eq(54)
    expect(visitor1.spending_money).to eq(10)
  end

  it "has no preferences and can add them to an array" do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    expect(visitor1.preferences).to eq([])

    visitor1.add_preference(:gentle)
    visitor1.add_preference(:thrilling)

    expect(visitor1.preferences).to eq([:gentle, :thrilling])
  end

  it "can check height to make sure a visitor is tall enough" do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')
    
    expect(visitor1.tall_enough?(54)).to eq(true)
    expect(visitor2.tall_enough?(54)).to eq(false)
    expect(visitor3.tall_enough?(54)).to eq(true)
    expect(visitor1.tall_enough?(64)).to eq(false)
  end
end
class Visitor
  attr_accessor :spending_money
  attr_reader :name,
              :height,
              :preferences


  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete("$").to_i
    @preferences = []
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(height_requirement)
    return false if height < height_requirement
    return true if height >= height_requirement
  end

  #  def favorite_ride
  #   rides = rider_log.keys
  #   rides.max_by { |ride| rider_log[ride] }
  # end
end
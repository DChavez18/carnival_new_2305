class Carnival
  attr_reader :duration,
              :rides
  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    return nil if @rides.empty?
    @rides.max_by { |ride| ride.rider_log.values.sum }
  end
end
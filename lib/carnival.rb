class Carnival
  attr_reader :duration,
              :rides,
              :summary
  def initialize(duration)
    @duration = duration
    @rides = []
    @summary = {}
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    return nil if @rides.empty?
    @rides.max_by { |ride| ride.rider_log.values.sum }
  end

  def most_profitable_ride
    return nil if @rides.empty?
  
    max_revenue = @rides.first.total_revenue
    profitable_ride = @rides.first
  
    @rides.each do |ride|
      if ride.total_revenue > max_revenue
        max_revenue = ride.total_revenue
        profitable_ride = ride
      end
    end
  
    profitable_ride
  end

  def total_revenue
    @rides.reduce(0) { |sum, ride| sum + ride.total_revenue }
  end
end
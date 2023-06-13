class Carnival
  attr_reader :duration,
              :rides,
              :riders
  def initialize(duration)
    @duration = duration
    @rides = []
    @riders = []
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

  def summary
    {
      visitor_count: visitor_count,
      revenue_earned: total_revenue,
      visitors: visitors_summary,
      rides: rides_summary
    }
  end

  def visitors_summary
    @rides.flat_map { |ride| ride.rider_log.keys }.uniq.map do |visitor|
      {
        visitor: visitor,
        favorite_ride: visitor.favorite_ride,
        total_money_spent: visitor.total_money_spent
      }
    end
  end

  def rides_summary
    @rides.map do |ride|
      {
        ride: ride,
        riders: ride.rider_log.keys,
        total_revenue: ride.total_revenue
      }
    end
  end
  
  def total_revenue
    @rides.reduce(0) { |sum, ride| sum + ride.total_revenue }
  end

  def visitor_count
    @rides.flat_map { |ride| ride.rider_log.keys }.uniq.size
  end
end


# {
#   visitor_count: integer, 
#   revenue_earned: integer, 
#   visitors: [
#     {
#       visitor: Visitor object,
#       favorite_ride: Ride object,
#       total_money_spent: integer
#     }, 
#     {
#       visitor: Visitor object,
#       favorite_ride: Ride object,
#       total_money_spent: integer
#     }],
#   rides: [
#     {
#       ride: Ride object,
#       riders: [Visitor objects],
#       total_revenue: integer
#     },
#     {
#       ride: Ride object,
#       riders: [Visitor objects],
#       total_revenue: integer
#     }]
#   }
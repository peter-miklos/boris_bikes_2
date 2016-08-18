require_relative 'van.rb'

class Garage

  attr_reader :stored_bikes

  def initialize
    @stored_bikes = []
  end

  def collect_from(van)
    @stored_bikes = van.stored_bikes
    van.remove_bikes
  end

  def repair_bikes
    @stored_bikes.map! {|bike| bike.set_working}
  end

  def remove_bike(bike)
    @stored_bikes.delete(bike)
  end

end

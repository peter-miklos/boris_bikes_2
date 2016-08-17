require_relative 'bike'

class DockingStation

  #def initialize
  #end

  def release_bike
    raise "No bike available" unless @bike
    #@bike
    Bike.new
  end

  def dock(bike)
    raise 'No spaces available' if @bike
    @bike = bike

  end

  #def bike
  #  @bike
  #end
  #commented out due to the use of attr_reader below

  attr_reader :bike

end

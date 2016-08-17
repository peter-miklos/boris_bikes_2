require_relative 'bike'

class DockingStation

  def release_bike
    Bike.new
  end

  def dock(bike)
    @bike = bike
  end

  #def bike
  #  @bike
  #end
  #commented out due to the use of attr_reader below

  attr_reader :bike

end

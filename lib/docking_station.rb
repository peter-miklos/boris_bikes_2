require_relative 'bike'

class DockingStation

  def initialize
    @bikes = []
  end

  def release_bike
    raise "No bike available" if empty?
    @bikes.shift
  end

  def dock(bike)
    raise 'No spaces available' if full?
    @bikes << bike

  end

  #def bike
  #  @bike
  #end
  #commented out due to the use of attr_reader below

  attr_reader :bikes

  private

  def full?
    @bikes.size >= 20
  end

  def empty?
    @bikes.empty?
  end

end

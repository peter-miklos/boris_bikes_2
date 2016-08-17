require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
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



  private

  def full?
    @bikes.size >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end

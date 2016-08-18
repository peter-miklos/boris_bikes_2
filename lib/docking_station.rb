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
    @bikes.each.with_index do |bike, index|
        return @bikes.delete_at(index) if bike.working?
    end
    raise "No working bikes available"

  end

  def dock(bike)
    raise 'No spaces available' if full?
    @bikes << bike

  end

  private

  def full?
    @bikes.size >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end

require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :bikes

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

  def rm_broken_bikes
    @bikes.each do |bike|
      if bike.working? == false then @bikes.delete(bike) end
    end
  end

  private

  def full?
    @bikes.size >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end

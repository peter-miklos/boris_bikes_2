require_relative 'docking_station.rb'


class Van
  attr_reader :stored_bikes

  def initialize
    @stored_bikes = []
  end

  def collect_broken_bikes_from(station)
    station.bikes.each do |bike|
      if bike.working? == false
        @stored_bikes << bike
      end
    end
    station.rm_broken_bikes
  end

  def remove_bikes
    @stored_bikes = []
  end

  def collect_fixed_bikes_from(garage)
    #@stored_bikes = garage.stored_bikes
    garage.stored_bikes.each do |bike|
      #puts bike.working?
      if bike.working?
        @stored_bikes << bike
        garage.remove_bike(bike)
      end
    end
  end

  def distribute_bike_to(station)
    @stored_bikes.each do |bike|
      break if station.capacity - station.bikes.size == 0
      station.dock(bike)
      @stored_bikes.delete(bike)
    end
  end
end

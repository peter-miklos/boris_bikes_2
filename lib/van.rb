require_relative 'docking_station.rb'


class Van
  attr_reader :stored_bikes

  def initialize
    @stored_bikes = []
  end

  def collect_from(station)
    station.bikes.each do |bike|
      if bike.working? == false
        @stored_bikes << bike
      end
    end
    station.rm_broken_bikes
  end
end

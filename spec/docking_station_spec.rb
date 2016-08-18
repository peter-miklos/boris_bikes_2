require "docking_station"

describe DockingStation do
    it { is_expected.to respond_to :release_bike}

    it "releases working bikes" do
      subject.dock(Bike.new)
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it "docks a bike" do
      expect(subject).to respond_to :dock
    end

    it "receives a bike" do
      expect(subject).to respond_to(:dock).with(1).arguments
    end

    it "docks something" do
      bike = Bike.new
      expect(subject.dock(bike)).to include(bike)
    end

    it "returns docked bikes" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end

    it "doesn't release bike from empty station" do
      expect{subject.release_bike}.to raise_error(RuntimeError, "No bike available")
    end

    #commented since it's not need from step 14
    #it 'doesn\'t dock the bike when the docking station is full' do
    #  subject.dock(Bike.new)
    #  expect{subject.dock(Bike.new)}.to raise_error 'No spaces available'
    #end

    it "doesn't dock a new bike if there are 20 bikes already docked" do
      (subject.capacity).times {subject.dock(Bike.new)}
      expect{subject.dock(Bike.new)}.to raise_error "No spaces available"
    end

    it 'initialiases with a default value of 20' do
      expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    end

    it "initializes docking station with a specific capacity (22)" do
      station = DockingStation.new(22)
      expect(station.capacity).to eq 22
    end

    it 'docks 22 bikes' do
      station = DockingStation.new(22)
      22.times {station.dock(Bike.new)}
      expect{station.dock(Bike.new)}.to raise_error "No spaces available"
    end

    it "doesn't release the bike if it's broken" do
      docking_station = DockingStation.new
      bike = Bike.new
      bike.set_broken
      docking_station.dock(bike)
      expect{docking_station.release_bike}.to raise_error("No working bikes available")
    end



end

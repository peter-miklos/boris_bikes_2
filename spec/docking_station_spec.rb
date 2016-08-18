require "docking_station"

describe DockingStation do

    it { is_expected.to respond_to :release_bike}

    let(:bike) {double :bike}
    let(:bike01) {double :bike01}
    let(:bike02) {double :bike02}
    it "releases working bikes" do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      released_bike = subject.release_bike
      expect(released_bike).to be_working
    end

    it "docks a bike" do
      expect(subject).to respond_to :dock
    end

    it "receives a bike" do
      expect(subject).to respond_to(:dock).with(1).arguments
    end

    it "docks something" do
      bike = double(:bike)
      expect(subject.dock(bike)).to include(bike)
    end

    it "returns docked bikes" do
      bike = double(:bike)
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
      (subject.capacity).times {subject.dock(double(:bike))}
      expect{subject.dock(double(:bike))}.to raise_error "No spaces available"
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
      22.times {station.dock(double(:bike))}
      expect{station.dock(double(:bike))}.to raise_error "No spaces available"
    end

    it "doesn't release the bike if it's broken" do
      docking_station = DockingStation.new
      allow(bike).to receive(:working?).and_return(false)
      #broken_bike = double(:bike)
      #bike.set_broken
      docking_station.dock(bike)
      expect{docking_station.release_bike}.to raise_error("No working bikes available")
    end

    it "should return the only working bike in an array of 2 broken bikes and 1 working bike" do
      docking_station = DockingStation.new
      allow(bike01).to receive(:working?).and_return(false)
      #bike01 = double(:bike)
      #bike01.set_broken
      allow(bike02).to receive(:working?).and_return(true)
      #bike02 = double(:bike)
      #bike03 = double(:bike)
      #bike03.set_broken
      docking_station.dock(bike01); docking_station.dock(bike02); docking_station.dock(bike01)
      expect(docking_station.release_bike).to eq bike02
    end

    it 'should release working bikes' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)

      released_bike = subject.release_bike

      expect(released_bike).to be_working
    end

end

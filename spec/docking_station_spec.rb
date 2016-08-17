require "docking_station"

describe DockingStation do
    it { is_expected.to respond_to :release_bike}

    it "releases working bikes" do
      subject.dock("bike")
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
      expect(subject.dock(bike)).to eq bike
    end

    it "returns docked bikes" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end

    it "doesn't release bike from empty station" do
      expect{subject.release_bike}.to raise_error(RuntimeError, "No bike available")
    end

    it 'doesn\'t dock the bike when the docking station is full' do
      subject.dock(Bike.new)
      expect{subject.dock(Bike.new)}.to raise_error 'No spaces available'
    end


end

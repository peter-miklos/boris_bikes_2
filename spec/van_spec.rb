require "van.rb"

describe Van do

  let(:working_bike) {double :working_bike}
  let(:broken_bike) {double :broken_bike}
  let(:station) {double :station}
  let(:garage) {double :garage}
  before(:each) do
    allow(working_bike).to receive(:working?) {true}
    allow(broken_bike).to receive(:working?) {false}
  end

  it "should removes all broken bikes from a docking station" do
    allow(station).to receive(:bikes).and_return([broken_bike, working_bike])
    allow(station).to receive(:rm_broken_bikes).and_return([working_bike])

    subject.collect_broken_bikes_from(station)

    expect(subject.stored_bikes).to eq ([broken_bike])

    allow(station).to receive(:bikes).and_return([working_bike])
    expect(station.bikes).to eq ([working_bike])
  end

  it "should collect the fixed bikes from the garage" do
    allow(garage).to receive(:stored_bikes).and_return([working_bike])
    allow(garage).to receive(:remove_bike).and_return(broken_bike)
    expect(subject.collect_fixed_bikes_from(garage)).to eq([working_bike])
  end

  it 'should distribute bikes to a station without over-filling it' do
    allow(garage).to receive(:stored_bikes).and_return([working_bike,working_bike,working_bike])
    allow(garage).to receive(:remove_bike).with(working_bike) {working_bike}
    allow(station).to receive(:capacity).and_return(2)
    allow(station).to receive(:bikes).and_return([])
    allow(station.bikes).to receive(:size).and_return(1)
    allow(station).to receive(:dock).with(working_bike) {[]}

    subject.collect_fixed_bikes_from(garage)
    subject.distribute_bike_to(station)

    expect(subject.stored_bikes).to eq []
  end
end

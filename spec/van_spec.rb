require "van.rb"

describe Van do

    let(:working_bike) {double :working_bike}
    let(:broken_bike) {double :broken_bike}
    let(:station) {double :station}
  it "should removes all broken bikes from a docking station" do
    van = Van.new
    allow(broken_bike).to receive(:working?).and_return(false)
    allow(working_bike).to receive(:working?).and_return(true)
    allow(station).to receive(:bikes).and_return([broken_bike, working_bike])
    allow(station).to receive(:rm_broken_bikes).and_return([working_bike])

    van.collect_from(station)

    expect(van.stored_bikes).to eq ([broken_bike])

    allow(station).to receive(:bikes).and_return([working_bike])
    expect(station.bikes).to eq ([working_bike])
  end
end

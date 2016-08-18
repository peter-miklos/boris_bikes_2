require "garage.rb"

describe Garage do
  let(:broken_bike01) {double :broken_bike01}
  let(:broken_bike02) {double :broken_bike02}
  let(:van) {double :van}
  let(:docking_station) {double :docking_station}

  it "should removes all bikes from a van" do
    garage = Garage.new
    allow(van).to receive(:stored_bikes).and_return([broken_bike01, broken_bike02])
    allow(van).to receive(:remove_bikes).and_return([])

    garage.collect_from(van)

    expect(garage.stored_bikes).to eq ([broken_bike01, broken_bike02])

    allow(van).to receive(:stored_bikes).and_return([])
    expect(van.stored_bikes).to eq ([])
  end

  it "repairs all the broken bikes" do
    garage = Garage.new
    allow(van).to receive(:stored_bikes).and_return([broken_bike01, broken_bike02])
    allow(van).to receive(:remove_bikes).and_return([])
    allow(broken_bike01).to receive(:set_working).and_return(broken_bike01)
    allow(broken_bike02).to receive(:set_working).and_return(broken_bike02)

    garage.collect_from(van)

    expect(garage.repair_bikes).to eq [broken_bike01, broken_bike02]

  end
end

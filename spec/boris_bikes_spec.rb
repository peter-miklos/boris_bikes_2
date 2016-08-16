require "boris_bikes"

describe DockingStation do

  it 'expects DockingStation to respond to release_bike method' do
      expect(DockingStation).to respond_to(release_bike)
  end

end

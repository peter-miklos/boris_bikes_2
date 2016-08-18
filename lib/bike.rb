class Bike
  def initialize
    @broken = false
  end

  def working?
    !@broken
  end

  def set_broken
    @broken = true
  end

  def set_working
    @broken = false
  end
end

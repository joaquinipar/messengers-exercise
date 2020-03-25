
class StandardVehicle
  def initialize; end

  def totalWeight(messenger_weight)
    messenger_weight + 1
  end

end


class Truck < StandardVehicle
  def initialize trailer
    @trailer = trailer
  end

  def totalWeight weight
    weight + 500*@trailer
  end

end


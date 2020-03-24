

class Messenger

  attr_reader :peso
  attr_reader :vehicle
  attr_reader :can_call

  def initialize weight, vehicle, can_call
    @peso = weight # En kilos
    @vehicle = vehicle
    @can_call = can_call
  end
  def can_call; @can_call end

  def weight
    return 0 if @vehicle.nil?
    @vehicle.totalWeight(peso)
  end

end

class StandardVehicle
  def initialize; end

  def totalWeight(messenger_weight)
    return messenger_weight + 1
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

bicycle = StandardVehicle.new

truck = Truck.new 2

robert = Messenger.new(70,bicycle,false)

chuck_norris = Messenger.new(900,nil,true)




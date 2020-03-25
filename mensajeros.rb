

class Messenger

  attr_reader :weight
  attr_reader :vehicle
  attr_reader :can_call

  def initialize weight, vehicle, can_call
    @weight = weight # En kilos
    @vehicle = vehicle
    @can_call = can_call

  end


  def weight!
    return 0 if @vehicle.nil?
    @vehicle.totalWeight(weight)
  end

  def can_deliver? package, destination

    destination.allows(self) && package.isPaid
  end

end

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

class BrooklynDestination

  def allows messenger
    messenger.weight! <= 1000
  end

end

class MatrixDestination

  def allows messenger
    messenger.can_call
  end
end

class Package

  attr_reader :isPaid

  def initialize isPaid
    @isPaid = isPaid
  end

end

class CourierCompany

  attr_reader :messengers

  def initialize messengers

    @messengers = messengers
  end

  def hire messenger; @messengers.push(messenger) end

  def fire messenger; @messengers.pop(messenger) end

  def fire_everyone; @messengers = [] end

  def isBig?; @messengers.length > 2 end

  def first_allowed package, destination; @messengers.first.can_deliver?(package,destination) end

  def last_messenger_weight; @messengers.last.weight! end

end





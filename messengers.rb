load './vehicles.rb'
load './destinations.rb'
load './packages.rb'
load './companies.rb'

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










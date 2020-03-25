
class Package

  attr_reader :isPaid
  attr_reader :price
  def initialize isPaid, destination
    @isPaid = isPaid
    @price = 50
    @destination = destination
  end

  def can_deliver? messenger

    @destination.allows(messenger) && @isPaid
  end

end

class LittlePackage < Package

  attr_reader :isPaid
  attr_reader :price

  def initialize(isPaid = true,destination)
    @isPaid = isPaid
    @price = 0
    @destination = destination
  end

end


class TravelerPackage < Package

  attr_reader :destinations

  def initialize destinations, amount_paid

    @destinations = destinations
    @price_per_destination = 100
    @amount_paid = amount_paid
  end

  def price
    @destinations.length * @price_per_destination
  end

  def isPaid; @amount_paid >= price end

  def can_deliver? messenger

    @destinations.all?(lambda{ |dest| dest.allows messenger }) && isPaid
  end
end






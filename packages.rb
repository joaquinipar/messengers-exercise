
class Package

  attr_reader :isPaid

  def initialize isPaid
    @isPaid = isPaid
  end

  def can_deliver? messenger, destination

    destination.allows(messenger) && @isPaid
  end

end

class LittlePackage < Package

  attr_reader :isPaid

  def initialize(isPaid = true)
    @isPaid = isPaid
  end

end

class TravelerPackage < Package



end
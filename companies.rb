
class CourierCompany

  attr_reader :messengers

  def initialize messengers

    @messengers = messengers
  end

  def hire messenger; @messengers.push(messenger) end

  def fire messenger; @messengers.pop(messenger) end

  def fire_everyone; @messengers = [] end

  def isBig?; @messengers.length > 2 end

  def first_allowed package; @messengers.first.can_deliver?(package) end

  def last_messenger_weight; @messengers.last.weight! end

end

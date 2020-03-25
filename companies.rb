
class CourierCompany

  attr_reader :messengers
  def initialize messengers, package_queue

    @messengers = messengers
    @package_queue = package_queue
  end

  def hire messenger; @messengers.push(messenger) end

  def fire messenger; @messengers.pop(messenger) end

  def fire_everyone; @messengers = [] end

  def isBig?; @messengers.length > 2 end

  def first_allowed package; @messengers.first.can_deliver?(package) end

  def last_messenger_weight; @messengers.last.weight! end

  def able_to_deliver? package

    @messengers.any? do |messenger| messenger.can_deliver?(package) end
  end

  def able_to_deliver package

    @messengers.filter do |messenger| messenger.can_deliver?(package) end

  end

  def deliver package

    if able_to_deliver? package
      able_to_deliver(package).first.deliver(package)
    else
      @package_queue.push package
    end
  end

  def deliver_packages packages

    packages.each do |package| deliver package end
  end

  def deliver_expensive

    deliver(@package_queue.max{ |package| package.price})
  end
end


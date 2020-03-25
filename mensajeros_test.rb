require "minitest/autorun"
load './mensajeros.rb'

class MessengersTest < Minitest::Test
  def setup
    @bicycle = StandardVehicle.new

    @truck = Truck.new 2

    @robert = Messenger.new(70,@bicycle,false)

    @chuck_norris = Messenger.new(900,nil,true)

    @neo = Messenger.new(0,nil,false)

    @brooklyn = BrooklynDestination.new

    @matrix = MatrixDestination.new

    @paid_package = Package.new true

    @unpaid_package = Package.new false

  end

  def test_that_robert_in_bycicle_can_deliver_paid_package_to_brooklyn
    assert @robert.can_deliver? @paid_package, @brooklyn
  end

  def test_that_neo_cannot_deliver_an_unpaid_package
    refute @neo.can_deliver? @unpaid_package, @brooklyn
  end

  def test_that_a_not_paid_package_cannot_be_delivered
    refute @robert.can_deliver? @unpaid_package, @brooklyn
  end



end
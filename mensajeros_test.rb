require "minitest/autorun"
load './mensajeros.rb'

class MessengersTest < Minitest::Test
  def setup
    @bicycle = StandardVehicle.new

    @truck = Truck.new 2

    @robert = Messenger.new(70,@bicycle,false)

    @chuck_norris = Messenger.new(900,nil,true)

    @neo = Messenger.new(0,nil,false)

    @generic_messenger = Messenger.new(75,@truck,true)

    @brooklyn = BrooklynDestination.new

    @matrix = MatrixDestination.new

    @paid_package = Package.new true

    @unpaid_package = Package.new false

    @company = CourierCompany.new [@neo,@chuck_norris,@robert]

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

  def test_that_a_messenger_is_successfully_hired
    @company.hire @generic_messenger
    assert_includes @company.messengers, @generic_messenger
  end

  def test_that_the_fist_messenger_can_deliver

    assert @company.first_allowed @paid_package, @brooklyn
  end

  def test_that_company_with_3_messengers_is_big

    assert @company.isBig?
  end

end

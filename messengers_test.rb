require "minitest/autorun"
load './messengers.rb'

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

    @paid_package = Package.new true, @brooklyn

    @unpaid_package = Package.new false, @brooklyn

    @traveler_package = TravelerPackage.new [@brooklyn,@matrix], 200

    @company = CourierCompany.new [@neo,@chuck_norris,@robert], [@paid_package]

  end

  def test_that_robert_in_bycicle_can_deliver_paid_package_to_brooklyn
    assert @robert.can_deliver? @paid_package
  end

  def test_that_neo_cannot_deliver_an_unpaid_package
    refute @neo.can_deliver? @unpaid_package
  end

  def test_that_a_not_paid_package_cannot_be_delivered
    refute @robert.can_deliver? @unpaid_package
  end

  def test_that_a_messenger_is_successfully_hired
    @company.hire @generic_messenger
    assert_includes @company.messengers, @generic_messenger
  end

  def test_that_the_fist_messenger_can_deliver

    assert @company.first_allowed @paid_package
  end

  def test_that_company_with_3_messengers_is_big

    assert @company.isBig?
  end

  def test_that_traveler_package_with_2_destinations_is_paid_with_200

    assert @traveler_package.isPaid
  end

  def test_that_neo_cannot_deliver_a_traveler_package_to_brooklyn_and_matrix

    refute @traveler_package.can_deliver? @neo

  end

  def test_that_someone_can_deliver_traveler_package

    assert @company.able_to_deliver? @traveler_package
  end

  def test_that_chuck_norris_is_the_only_one_that_is_able_to_deliver_traveler_package

    assert_equal @company.able_to_deliver(@traveler_package), [@chuck_norris]
  end


end

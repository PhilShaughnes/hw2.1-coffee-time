require 'minitest/autorun'
require './human'
require './coffee'

class CaffeineTest < MiniTest::Test
  def test_humans_tend_to_be_sleepy
    tyler = Human.new "Tyler"
    assert tyler.alertness < 0.1
  end

  def test_humans_need_coffee
    randy = Human.new "Randy"
    refute randy.has_coffee?
    assert randy.needs_coffee?
  end

  def test_humans_can_drink_coffee
    sherri = Human.new "Sherri"
    tsmf = Coffee.new "Triple Shot Mocha Frappuccino"
    assert tsmf.full?

    sherri.buy tsmf
    sherri.drink!
    assert(sherri.alertness.between?(0.1, 0.33))
    refute tsmf.full?
    refute tsmf.empty?
  end

  def test_humans_can_drink_all_the_coffee
    trevor = Human.new "Trevor"
    tsmf = Coffee.new "Triple Shot Mocha Frappuccino"
    trevor.buy tsmf

    3.times { trevor.drink! }
    assert tsmf.empty?
    assert trevor.alertness > 0.9
  end
end

class EspressoTest < MiniTest::Test

  def test_humans_can_drink_espresso
    joe = Human.new "Joe"
    esp = Espresso.new("Espresso")
    assert esp.full?

    joe.buy esp
    joe.drink!
    assert(joe.alertness.between?(0.33, 0.55))
    refute esp.full?
    assert esp.empty?
  end

  def test_chris_can_drink_all_the_espresso
    chris = Human.new("Chris", 2.2)

    6.times do
      esp = Espresso.new("Espresso")
      chris.buy esp
      assert esp.full?
      chris.drink!
      assert esp.empty?
    end
    assert chris.alertness > chris.goal_alert
  end
end

class TeaTest < MiniTest::Test

  def test_humans_can_drink_tea
    toby = Human.new "Toby"
    gtea = Tea.new("Green")
    assert gtea.full?

    toby.buy gtea
    toby.drink!
    assert(toby.alertness.between?(0.2, 0.3))
    refute gtea.full?
    refute gtea.empty?
  end

  def test_steffi_can_keep_drinking_all_the_tea
    steffi = Human.new("Steffi")
    chai = Tea.new("Chai")

    2.times do #drink 2 full tea's too get alertness up!
      chai = Tea.new("Chai")
      steffi.buy chai
      assert chai.full?
      chai.volume.times{ steffi.drink! } #drinks the full beverage!
      assert chai.empty?, chai.inspect
    end

    assert steffi.alertness > steffi.goal_alert, steffi.alertness.inspect
  end
end

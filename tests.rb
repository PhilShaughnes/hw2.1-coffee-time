require 'minitest/autorun'

require './human'
require './coffee'
require './tea'

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
    esp = Coffee.new("Espresso", 0.4, 1)
    assert esp.full?

    joe.buy esp
    joe.drink!
    assert(joe.alertness.between?(0.33, 0.55))
    refute esp.full?
    assert esp.empty?
  end

  def test_chris_can_drink_all_the_coffee
    chris = Human.new("Chris", 2.2)

    6.times do
      esp = Coffee.new("Espresso", 0.4, 1)
      chris.buy esp
      assert esp.full?
      chris.drink!
      assert esp.empty?
    end
    assert chris.alertness > chris.goal_alert
  end
end

class EspressoTest < MiniTest::Test

  def test_humans_can_drink_espresso
    toby = Human.new "Toby"
    esp = Coffee.new("Espresso", 0.4, 1)
    assert esp.full?

    joe.buy esp
    joe.drink!
    assert(joe.alertness.between?(0.33, 0.55))
    refute esp.full?
    assert esp.empty?
  end

  def test_chris_can_drink_all_the_coffee
    chris = Human.new("Chris", 2.2)

    6.times do
      esp = Coffee.new("Espresso", 0.4, 1)
      chris.buy esp
      assert esp.full?
      chris.drink!
      assert esp.empty?
    end
    assert chris.alertness > chris.goal_alert
  end
end

# class TeaTest < MiniTest::Test
#
#   def test_humans_can_drink_espresso
#     toby = Human.new "Toby"
#     esp = Coffee.new("Espresso", 0.4, 1)
#     assert esp.full?
#
#     joe.buy esp
#     joe.drink!
#     assert(joe.alertness.between?(0.33, 0.55))
#     refute esp.full?
#     assert esp.empty?
#   end
#
#   def test_chris_can_drink_all_the_coffee
#     chris = Human.new("Chris", 2.2)
#
#     6.times do
#       esp = Coffee.new("Espresso", 0.4, 1)
#       chris.buy esp
#       assert esp.full?
#       chris.drink!
#       assert esp.empty?
#     end
#     assert chris.alertness > chris.goal_alert
#   end
# end

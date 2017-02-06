class Coffee
  attr_accessor :name, :drinks, :caffeine, :volume

  def initialize(name, caffeine = 0.32, drinks = 3)
    @name = name
    @drinks = drinks
    @caffeine = caffeine
    @volume = drinks
  end

  def full?
    self.drinks == self.volume
  end

  def empty?
    self.drinks == 0
  end
end

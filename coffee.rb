class Coffee
  attr_accessor :name, :drinks, :caffeine, :volume

  def initialize(name)
    @name = name
    @drinks = 3
    @caffeine = 0.32
    @volume = 3

  end

  def full?
    self.drinks == self.volume
  end

  def empty?
    self.drinks == 0
  end
end

class Espresso < Coffee
  def initialize(name)
    @name = name
    @drinks = 1
    @caffeine = 0.4
    @volume = 1
  end
end

class Tea < Coffee
  def initialize(name)
    @name = name
    @drinks = 3
    @caffeine = 0.25
    @volume = 3
  end
end

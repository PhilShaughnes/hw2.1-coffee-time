class Human
  attr_accessor :name,
                :alertness,
                :bev,
                :goal_alert

  def initialize(name, required_alertness = 1, alertness=0)
    self.name = name
    self.alertness = alertness
    self.goal_alert = required_alertness
  end

  def has_coffee?
    bev
  end

  def needs_coffee?
    alertness < goal_alert
  end

  def buy(item)
    self.bev = item
  end

  def drink!
    if self.has_coffee? && !bev.empty?
      bev.drinks -= 1
      self.alertness += bev.caffeine
    end
  end

end

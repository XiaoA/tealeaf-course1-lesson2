
class MyCar

  attr_accessor :color
  attr_reader :year

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You hit the gas and accelerate #{number} MPH."
  end

  def brake(number)
    @current_speed -= number
    puts "You hit the brakes and slow down #{number} MPH."
  end

  def current_speed
    puts "You're now going #{current_speed} MPH."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park!"
  end

  def spray_paint(color)
    self.color = color
    puts "You painted your car #{color}? It looks like new!"
  end
end

civic = MyCar.new(2014, 'honda civic', 'brown')
civic.spray_paint('blue')


# classes_and_objects_1/exercise1.rb

class MyCar
  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} MPH."
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
end

civic = MyCar.new(2014, 'honda civic', 'brown')
civic.speed_up(20)
civic.current_speed
civic.speed_up(20)
civic.current_speed
civic.brake(20)
civic.current_speed
civic.brake(20)
civic.current_speed
civic.shut_down
civic.current_speed


# classes_and_objects_2/exercise2.rb

class MyCar

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon"
  end
  
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
  
  def to_s
    "My car is a #{self.color}, #{self.year}, #{@model}."
  end
end

civic = MyCar.new("2014", "Honda Civic", "brown"}
puts civic # => "My car is a brown, 2014, Honda Civic."

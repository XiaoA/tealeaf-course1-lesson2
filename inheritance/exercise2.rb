
# inheritance/exercise2.rb
class Vehicle
  @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts "You have #{@@number_of_vehicles} vehicles."
  end
  
  attr_accessor :color
  attr_reader :year
  attr_reader :model

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} MPG"
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

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{self.color}, #{self.year}, #{@model}."
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  def to_s
    "My truck is a #{self.color}, #{self.year}, #{@model}."
  end
end

car = MyCar.new('2014', "Honda Civic", "brown")
truck = MyTruck.new('2012', "Ford F150", "blue")

puts car
puts truck
puts Vehicle.number_of_vehicles

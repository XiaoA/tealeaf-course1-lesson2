
# inheritance/exercise6.rb

# Write a private method call 'age' that calculates the age of the vehicle.

module Haulable
  def can_haul?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles."
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
    puts "#{miles / gallons} miles per gallon"
  end
  
  def speed_up(number)
    @current_speed += number
    puts "You hit the gas and accelerate #{number} mph."
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

  def age
    puts "Your #{self.model} is #{calculate_vehicle_age} years old."
  end
  
  private

  def calculate_vehicle_age
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{self.color}, #{self.year}, #{@model}."
  end
end

class MyTruck < Vehicle
  include Haulable

  NUMBER_OF_DOORS = 2

  def to_s
    "My truck is a #{self.color}, #{self.year}, #{@model}."
  end
end

car = MyCar.new(2014, "Honda Civic", "brown")
truck = MyTruck.new(2012, "Ford F150", "blue")

puts car.age
puts truck.age

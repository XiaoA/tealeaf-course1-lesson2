
# classes_and_objects_2/exercise1.rb

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
  end

  MyCar.gas_mileage(11, 389) # => "35 miles per gallon"

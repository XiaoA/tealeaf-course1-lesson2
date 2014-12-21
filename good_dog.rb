
# [[file:~/tealeaf/lesson_2/lesson_2_notes.org::*Modules][Modules:1]]

# good_dog.rb

module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("Arf!")
bob = HumanBeing.new
bob.speak("Hello!")

# Modules:1 ends here

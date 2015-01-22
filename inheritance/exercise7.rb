
# inheritance/exercise7.rb

class Student

  attr_accessor :name, :grade 

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(classmate)
    grade > classmate.grade
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new("Joe", 94)
bob = Student.new("Bob", 87)

puts "True or false...Joe's grade is better than Bob's?"
puts joe.better_grade_than?(bob)
puts "==="
puts "True or false...Bob's grade is better than Joe's?"
puts bob.better_grade_than?(joe)

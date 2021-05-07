# variables

# Integer
count = 100
# String
course = "SaaS 201"
# Boolean
is_live = true
# Array of strings
lessons = ["Basic", "Intermediate", "Advanced"]

# to_s method to convert integer to string, int + string will give error
age = 20
name = "Sachin"
puts "I am #{name} and I am " + age.to_s + " years old."
puts "I am #{name} and I am #{age.to_s} years old."

# Float
puts 5 / 2
puts 5.0 / 2
puts 5 / 2.0
puts 5.0 / 2.0

# to_f method to convert int into float
nums = [1, 2, 3, 4, 5, 6]
puts "The average of these numbers are #{nums.sum.to_f / nums.length}"

# String
str = "aLl Is WelL."
puts str.length
puts str.upcase
puts str.downcase
puts str.capitalize

# Boolean and if statement
puts 1 == 1
puts "this" == "that"
puts 1 < 2
puts 1 > 2
puts 42 >= 42

puts "Fiction or non-fiction?"
genre = gets.chomp.downcase

if genre == "fiction"
  puts "try reading Cryptonomicon by Neal Stephenson"
elsif genre == "non-fiction"
  puts "You should read the Ascent of Man by Jacob Bronowski!"
else
  puts "Oh I don't know about that genre"
end

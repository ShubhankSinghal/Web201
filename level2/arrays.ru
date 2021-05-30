# Problem 1.
# Given a nested array of first names and last names,
# return a new array with the full names.

names = [["Jhumpa", "Lahiri"], ["J. K", "Rowling"], ["Devdutt", "Pattanaik"]]
# fill in code that will return a new array of the full names:
#   ["Jhumpa Lahiri", "J.K Rowling", ...]

puts "Problem 1:"
puts "Before:\n#{names}"
names = names.map { |x| x.join(" ") }
puts "After:\n#{names}\n\n"

# Problem 2.
# Given two arrays books and authors, merge them and print who wrote which book.

books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
# fill in code that will print:
#   Design As Art was written by Bruno Munari
#   Anathem was written by Neal Stephenson
#   ...

puts "Problem 2:"
puts "Before:\nBooks: #{books}\nAuthors: #{authors}"
output = books.map.with_index { |book, i| "#{book} was written by #{authors[i]}" }
puts "After:\nOutput: #{output}\n\n"

# Problem 3.
# Print the given list of todos by category.
# (You haven't learned Hashes yet, so use only arrays.)

todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
]

# Fill in code that will print:
#   money:
#     Send invoice
#     Pay rent
#     Pay taxes
#   organize:
#     Clean room
#     Arrange books
#   food:
#     Buy groceries

# Hints:
# 1. You should first build an array just for categories which looks like this:
# [["money", ["Send invoice", "Pay rent"]], ...]
# 2. When you find something from an array and it doesn't exist,
# then Ruby will return nil. You can check if something is nil like this:

# nums = [1,2,3]
# large_number = nums.find {|i| i > 10}
# if large_number == nil
#   puts "No large numbers!"
# else
#   puts large_number
# end

puts "Problem 3:"
puts "Before:\n#{todos}"
temp_arr = Array.new
fin_arr = Array.new
todos.each.with_index do |arr, i|
  temp = temp_arr.index(arr[1])
  if temp == nil
    temp_arr << arr[1]
    fin_arr << [arr[1], [arr[0]]]
  else
    fin_arr[temp][1] << arr[0]
  end
end
puts "\nOutput:"
fin_arr.each do |ele|
  puts "#{ele[0]}:"
  ele[1].each do |prop|
    puts "\t#{prop}"
  end
end

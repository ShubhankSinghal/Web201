# Problem 1.
# Given two arrays books and authors, merge them into a single Hash.
# The keys of the Hash must be the lower-cased firstname of the authors, and must be symbols.

books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
# fill in code that will create a Hash that looks like:
#   {
#     :bruno => "Design as Art",
#     :neal => "Anathem",
#     ...
#   }
# Hint: To convert a string into a symbol, use the .to_sym method

puts "Problem 1:"
puts "Before:\nBooks: #{books}\nAuthors: #{authors}\n"
fin_hash = {}
authors.each.with_index do |x, i|
  fin_hash[x.split(" ")[0].downcase.to_sym] = books[i]
end
puts "Output: #{fin_hash}\n"

# Problem 2.
# Given this list of todos, create a Hash keyed by category,
# whose value is an array containing all the todos in that category.
# The keys of the Hash must be a symbol.

todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
]
# Fill in code that will create a Hash that looks like:
#   {
#     :money =>
#       ["Send invoice", "Pay rent", ...],
#     ...
#   }

puts "\nProblem 2:"
puts "Before:\nTodos: #{todos}\n"
fin_hash = {}
todos.each.with_index do |arr, i|
  if fin_hash[arr[1].downcase.to_sym] == nil
    fin_hash[arr[1].downcase.to_sym] = Array.new
  end
  fin_hash[arr[1].downcase.to_sym] << arr[0]
end
puts "Output: #{fin_hash}\n"

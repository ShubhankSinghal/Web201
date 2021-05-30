# Problem 1.
# Fill-in the following code

# write code so the program prints:
#   Hello Mr. Mandela
#   Welcome Mr. Turing

puts "Problem1:\nOutput:"

def salute(name, sal)
  "\t#{sal.capitalize} Mr. #{name.split(" ")[-1]}"
end

puts salute("Nelson Rolihlahla Mandela", "hello")
puts salute("Sir Alan Turing", "welcome")

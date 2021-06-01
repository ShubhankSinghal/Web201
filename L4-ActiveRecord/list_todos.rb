require "./todo.rb"
connect_db!

displayable_list = Todo.all.map { |todo| todo.to_displayable_string }
puts displayable_list

require "./connect_db.rb"
require "./todo.rb"

connect_db!
Todo.show_list

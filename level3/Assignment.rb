require "date"

class Todo

  # Initializing todo item
  def initialize(text, due_date, completed)
    @text = text
    @due_date = due_date
    @completed = completed
  end

  # getter for text
  def text?
    @text
  end

  # getter for due_date
  def due_date?
    @due_date
  end

  # getter for completed
  def completed?
    @completed
  end

  # to fetch overdue
  def overdue?
    due_date? < Date.today
  end

  # to fetch due_today
  def due_today?
    due_date? == Date.today
  end

  # to fetch due_later
  def due_later?
    due_date? > Date.today
  end

  # to format data into required string
  def to_displayable_string
    display_status = completed? ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date?
    "#{display_status} #{text?} #{display_date}"
  end
end

class TodosList

  # initialize the todoslist
  def initialize(todos)
    @todos = todos
  end

  # fetch the overdue list
  def overdue
    TodosList.new(@todos.filter { |todo| todo.overdue? })
  end

  # fetch the due_today list
  def due_today
    TodosList.new(@todos.filter { |todo| todo.due_today? })
  end

  # fetch the due_later list
  def due_later
    TodosList.new(@todos.filter { |todo| todo.due_later? })
  end

  # to add data into todolist
  def add(data)
    @todos << data
  end

  # transform the data
  def to_displayable_list
    @todos.map { |x| x.to_displayable_string }
  end
end

date = Date.today
todos = [
  { text: "Submit assignment", due_date: date - 1, completed: false },
  { text: "Pay rent", due_date: date, completed: true },
  { text: "File taxes", due_date: date + 1, completed: false },
  { text: "Call Acme Corp.", due_date: date + 1, completed: false },
]

todos = todos.map { |todo|
  Todo.new(todo[:text], todo[:due_date], todo[:completed])
}

todos_list = TodosList.new(todos)

todos_list.add(Todo.new("Service vehicle", date, false))

puts "My Todo-list\n\n"

puts "Overdue\n"
puts todos_list.overdue.to_displayable_list
puts "\n\n"

puts "Due Today\n"
puts todos_list.due_today.to_displayable_list
puts "\n\n"

puts "Due Later\n"
puts todos_list.due_later.to_displayable_list
puts "\n\n"

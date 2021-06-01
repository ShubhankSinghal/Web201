require "./connect_db.rb"
connect_db!

class Todo < ActiveRecord::Base

  # to fetch overdue
  def overdue?
    due_date < Date.today
  end

  # to fetch due_today
  def due_today?
    due_date == Date.today
  end

  # to fetch due_later
  def due_later?
    @due_date > Date.today
  end

  # to format data
  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{display_status} #{todo_text} #{display_date}"
  end

  # to format all elements of the list
  def self.to_displayable_list
    all.map { |todo| todo.to_displayable_string }
  end

  def self.show_list
    puts "My Todo-list\n\n"

    puts "Overdue\n"
    puts Todo.overdue.to_displayable_list
    puts "\n\n"

    puts "Due Today\n"
    puts Todo.due_today.to_displayable_list
    puts "\n\n"

    puts "Due Later\n"
    puts Todo.due_later.to_displayable_list
    puts "\n\n"
  end

  def self.add_task(todo_text, due_in_days)
    Todo.create!(todo_text: "Buy groceries", due_date: Date.today + 4, completed: false)
  end

  def mark_as_complete(todo_id)
    todo = Todo.where("id: ?", todo_id)
    todo.save
  end
end

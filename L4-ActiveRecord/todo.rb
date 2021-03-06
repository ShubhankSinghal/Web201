require "./connect_db.rb"
connect_db!

class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
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

  def self.overdue
    where("due_date < ?", Date.today)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.show_list
    puts "My Todo-list\n\n"

    puts "Overdue\n"
    puts overdue.map { |todo| todo.to_displayable_string }
    puts "\n\n"

    puts "Due Today\n"
    puts due_today.map { |todo| todo.to_displayable_string }
    puts "\n\n"

    puts "Due Later\n"
    puts due_later.map { |todo| todo.to_displayable_string }
    puts "\n\n"
  end

  def self.add_task(todo_object)
    text = todo_object[:todo_text]
    days = todo_object[:due_in_days]
    Todo.create!(todo_text: text, due_date: Date.today + days, completed: false)
  end

  def self.mark_as_complete(todo_id)
    todo = Todo.find_by("id = ?", todo_id)
    todo[:completed] = true
    todo.save
    todo
  end
end

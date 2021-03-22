require "./task"
require "./todo"

class TodoApp
  def initialize(initial_operations: [])
    @todo = ToDo.new
  end
end

app = TodoApp.new

require "./task"
require "./todo"
require "./todo_app"

def get_demo_params
  [[method: :add, params: { title: "洗濯", content: "7時までに干し終える" }],
   [method: :add, params: { title: "仕事", content: "9時〜18時" }],
   { method: :info },
   [method: :delete, params: { id: 1 }],
   [method: :add, params: { title: "買物", content: "卵，ヨーグルト" }],
   [method: :delete, params: { id: 4 }],
   [method: :delete, params: { id: 3 }],
   { method: :info }]
end

def main(demo)
  initial_operations = demo ? get_demo_params : []
  todo_app = TodoApp.new(initial_operations)
  todo_app.start
end

main ARGV.include?("demo") ? true : false

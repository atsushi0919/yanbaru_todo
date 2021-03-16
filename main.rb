require "./task"
require "./todo"
require "./controller"

def demo
  task1 = Task.new(title: "洗濯", content: "7時までに干し終える")
  task2 = Task.new(title: "仕事", content: "9時〜18時")
  task3 = Task.new(title: "買物", content: "卵，ヨーグルト")
  todo = ToDo.new
  sample_operations = [[:add, task1],
                       [:add, task2],
                       :info,
                       [:delete, { id: 1 }],
                       [:add, task3],
                       [:delete, { id: 4 }],
                       [:delete, { id: 3 }],
                       :info]

  sample_operations.each do |sample_operation|
    todo.public_send(*sample_operation)
  end
end

def main(mode = nil)
  return demo if mode != "manual"

  todo = ToDo.new
  controller = Controller.new
  while true
    operation = controller.input
    break if operation == :quit
    todo.public_send(*operation)
  end
  puts "おわり"
end

main(*ARGV[0])

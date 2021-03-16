require "./task"
require "./todo"
require "./todo_interface"

def demo
  task1 = Task.new(title: "洗濯", content: "7時までに干し終える")
  task2 = Task.new(title: "仕事", content: "9時〜18時")
  task3 = Task.new(title: "買物", content: "卵，ヨーグルト")
  todo = ToDo.new

  todo.add(task1)
  todo.add(task2)
  todo.info
  todo.delete(id: 1)
  todo.add(task3)
  todo.delete(id: 4)
  todo.delete(id: 3)
  todo.info
end

def manual
  todo = ToDo.new
  todoif = TodoInterface.new
  while true
    operation = todoif.start
    p operation
    # add の場合は task を生成し operate を書き換え
    if operation[:method] == :add
      task = Task.new(title: operation[:title],
                      content: operation[:content])
      p task
      operation = { method: operation[:method],
                    task: task }
    end
    # quit が 選択されたらループを抜ける
    break if operation[:method] == :quit

    # operation の valueを渡して todoメソッドを実行する
    todo.public_send(*operation.values)
  end
  puts "おわり"
end

ARGV.include?("manual") ? manual : demo

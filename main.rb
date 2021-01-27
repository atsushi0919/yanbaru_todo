require "byebug"

class Task
  attr_reader :id, :title, :content

  @@count = 0

  def initialize(title:, content:)
    @id = @@count += 1
    @title = title
    @content = content
  end

  def info
    "[No.#{@id}] #{@title}:#{@content}"
  end
end

class ToDo
  OPERATION = { add: "追加",
                delete: "削除" }

  def initialize
    @tasks = []
  end

  def add(task)
    @tasks << task
    puts get_info_message(task, OPERATION[:add])
  end

  def delete(id:)
    target_idx = @tasks.find_index { |task| task.id == id }
    if target_idx.nil?
      puts "【！】 該当idのタスクはありません。"
    else
      target_task = @tasks[target_idx]
      @tasks.delete_at(target_idx)
      puts get_info_message(target_task, OPERATION[:delete])
    end
  end

  def info
    return puts "【！】 タスクはありません。" if @tasks.empty?
    info_lines = @tasks.map { |task| get_info_message(task) }
    puts <<~EOS
           *=*=*=*=*=*=*=*=* task *=*=*=*=*=*=*=*=*
           #{info_lines.join("\n")}
           *=*=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*
         EOS
  end

  private

  # info表示用データを作成
  def get_info_message(task, operation = "")
    operation_message = operation.empty? ? "" : "【#{operation}】 "
    operation_message << "[No.#{task.id}] #{task.title}:#{task.content}"
  end
end

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

=begin
【追加】 [No.1] 洗濯:7時半までに干し終える
【追加】 [No.2] 仕事:9時〜18時
*=*=*=*=*=*=*=*=* task *=*=*=*=*=*=*=*=*
[No.1] 洗濯:7時半までに干し終える
[No.2] 仕事:9時〜18時
*=*=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*
【削除】 [No.1] 洗濯:7時半までに干し終える
【追加】 [No.3] 買物:卵, ヨーグルト
【！】 該当idのタスクはありません。
【削除】 [No.3] 買物:卵, ヨーグルト
*=*=*=*=*=*=*=*=* task *=*=*=*=*=*=*=*=*
[No.2] 仕事:9時〜18時
*=*=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*
=end

require "./message_color"

class ToDo
  include MessageColor

  def initialize
    @tasks = []
  end

  # タスク追加
  def add(task:)
    @tasks << task
    puts info_message(task, operation: "追加")
  end

  # タスク削除
  def delete(id: 0)
    target_task = @tasks.find { |task| task.id == id }
    if target_task.nil?
      puts unfound_message(add_id_message: true)
    else
      @tasks.delete target_task
      puts info_message(target_task, operation: "削除")
    end
  end

  # タスク一覧表示
  def info
    puts @tasks.empty? ? unfound_message : tasks_info
  end

  private

  # @tasks 一覧表示を返す
  def tasks_info
    info_lines = @tasks.map { |task| info_message(task) }
    <<~EOS
      *=*=*=*=*=*=*=*=* task *=*=*=*=*=*=*=*=*
      #{info_lines.join("\n")}
      *=*=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*
    EOS
  end

  # info / operation 表示用データを返す
  def info_message(task, operation: "")
    message = operation.empty? ? "" : "【#{operation}】 "
    message << "[No.#{task.id}] #{task.title}: #{task.content}"
    if operation == "追加"
      change_message_color(message: message, color: "green")
    elsif operation == "削除"
      change_message_color(message: message, color: "yellow")
    else
      message
    end
  end

  # undefind 表示用データを返す
  def unfound_message(add_id_message: false)
    message = "【！】"
    message <<= "該当idの" if add_id_message
    message << "タスクはありません。"
    change_message_color(message: message, color: "red")
  end
end

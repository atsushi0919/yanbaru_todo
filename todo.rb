class ToDo
  OPERATION = { add: "追加",
                delete: "削除" }

  def initialize
    @tasks = []
  end

  # タスク追加
  def add(task)
    @tasks << task
    puts info_message(task, OPERATION[:add])
  end

  # タスク削除
  def delete(id:)
    target_index = @tasks.find_index { |task| task.id == id }
    if target_index.nil?
      puts unfound_message(add_id_message = true)
    else
      target_task = @tasks[target_index]
      @tasks.delete_at(target_index)
      puts info_message(target_task, OPERATION[:delete])
    end
  end

  # タスク一覧表示
  def info
    puts @tasks.empty? ? unfound_message : tasks_info
  end

  private

  # @tasks 一覧表示用のデータを返す
  def tasks_info
    info_lines = @tasks.map { |task| info_message(task) }
    <<~EOS
      *=*=*=*=*=*=*=*=* task *=*=*=*=*=*=*=*=*
      #{info_lines.join("\n")}
      *=*=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*
    EOS
  end

  # info 表示用のデータを返す
  def info_message(task, operation = "")
    operation_message = operation.empty? ? "" : "【#{operation}】 "
    operation_message << "[No.#{task.id}] #{task.title}:#{task.content}"
  end

  # undefind 表示用のデータを返す
  def unfound_message(add_id_message = false)
    unfound_message = "【！】"
    unfound_message <<= add_id_message ? "該当idの" : ""
    unfound_message << "タスクはありません。"
  end
end

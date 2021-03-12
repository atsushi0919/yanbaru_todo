class ToDo
  OPERATION = { add: "追加", delete: "削除" }

  def initialize
    @tasks = []
  end

  # タスク追加
  def add(task)
    @tasks << task
    puts info_message task, operation: OPERATION[:add]
  end

  # タスク削除
  def delete(id:)
    target_task = @tasks.find { |task| task.id == id }
    if target_task.nil?
      puts unfound_message(add_id_message: true)
    else
      @tasks.delete target_task
      puts info_message target_task, operation: OPERATION[:delete]
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

  # info / operation 表示用のデータを返す
  def info_message(task, operation: "")
    message = operation.empty? ? "" : "【#{operation}】 "
    message << "[No.#{task.id}] #{task.title}:#{task.content}"
  end

  # undefind 表示用のデータを返す
  def unfound_message(add_id_message: false)
    message = "【！】"
    message <<= "該当idの" if add_id_message
    message << "タスクはありません。"
  end
end

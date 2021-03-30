require "./message_color"

class ToDo
  include MessageColor

  def initialize
    @tasks = []
  end

  # タスク追加
  def add(task:)
    @tasks << task
    info_message(task, method: "追加")
  end

  # タスク削除
  def delete(id: 0)
    target_task = @tasks.find { |task| task.id == id }
    if target_task.nil?
      unfound_message(add_id_message: true)
    else
      @tasks.delete target_task
      info_message(target_task, method: "削除")
    end
  end

  # タスク一覧表示
  def info
    @tasks.empty? ? unfound_message : tasks_info
  end

  private

  # @tasks 一覧表示
  def tasks_info
    puts "*=*=*=*=*=*=*=*=* task *=*=*=*=*=*=*=*=*"
    @tasks.each { |task| task.info }
    puts "*=*=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*"
  end

  # operation 実行成功時の表示 （追加: 緑, 削除: 黄）
  def info_message(task, method: "")
    message = method.empty? ? "" : "【#{operation}】 "
    message << "[No.#{task.id}] #{task.title}: #{task.content}"
    if method == "追加"
      message = change_message_color(message: message, color: "green")
    elsif method == "削除"
      message = change_message_color(message: message, color: "yellow")
    end
    puts message
  end

  # info, delete 失敗時の表示（赤）
  def unfound_message(add_id_message: false)
    message = "【！】"
    message <<= "該当idの" if add_id_message
    message << "タスクはありません。"
    puts change_message_color(message: message, color: "red")
  end
end

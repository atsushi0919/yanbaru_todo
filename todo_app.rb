require "./task"
require "./todo"
require "./manual_interface"
require "byebug"

class TodoApp
  def initialize
    @todo = ToDo.new
    @manual_interface = ManualInterface.new
  end

  # 手動入力
  def manual
    while true
      operation = @manual_interface.input
      break if operation[:method] == :quit
      execute(**operation)
    end
    put "手動入力を終了します"
  end

  # 操作を実行する
  def execute(method:, params: {})
    args = params
    if method == :add
      error_message = validate_add_params(**params)
      unless error_message.empty?
        puts error_message
        return
      end
      args = { task: Task.new(**params) }
    end
    @todo.public_send(method, **args)
  end

  def validate_add_params(title:, content:)
    message = []
    message << "【！】件名を入力してください" if title.empty?
    message << "【！】件名は10文字以内です" if title.length > 10
    message << "【！】内容は40文字以内です" if content.length > 40
    message.empty? ? "" : change_message_color(message: message.join("\n"), color: "red")
  end
end

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
    operation = {}
    while operation[:method] != :quit
      operation = @manual_interface.input
      execute(**operation)
    end
  end

  # 操作を実行する
  def execute(method:, params: {})
    case method
    when :add
      return unless valid_add_params?(**params)
      args = { task: Task.new(**params) }
    when :quit
      puts "手動入力を終了します"
      return
    else
      args = params
    end
    @todo.public_send(method, **args)
  end

  def valid_add_params?(title:, content:)
    message = []
    if title.empty?
      message << "【！】件名を入力してください"
    end
    if title.length > 10
      message << "【！】件名は10文字以内です"
    end
    if content.length > 40
      message << "【！】内容は40文字以内です"
    end
    if message.empty?
      return true
    else
      #puts @todo.change_message_color(message: message.join("\n"), color: "red")
      puts message.join("\n")
      return false
    end
  end
end

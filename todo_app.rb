require "./task"
require "./todo"
require "./manual"
require "./message_color"

class TodoApp
  include MessageColor

  def initialize
    @todo = ToDo.new
    @manual = Manual.new
  end

  # 手動入力
  def input_manual(operation: {})
    while operation[:method] != :quit
      operation = @manual.input
      execute(**operation)
    end
  end

  # 操作を実行する
  def execute(method:, params: {})
    begin
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
      # ruby2.6以前用 double splat での空hash引数対策
      if args.empty?
        @todo.public_send(method)
      else
        @todo.public_send(method, **args)
      end
    rescue => e
      message = "【！】エラーが発生しました\n"
      message << "#{e.class.to_s}, #{e.message}"
      puts change_message_color(message: message, color: "red")
      exit
    end
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

    return true if message.empty?
    message = message.join("\n")
    puts change_message_color(message: message, color: "red")
    false
  end
end

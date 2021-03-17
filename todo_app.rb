require "io/console"
require "./task"
require "./todo"

class TodoApp < Todo
  def initialize(initial_operations)
    super()
    return if initial_operations.empty?
    initial_operations.each do |operation|
      execute_method(operation)
    end
  end

  # アプリ起動
  def start
    while true
      put_command_info
      execute_method(method: choose_method)
    end
  end

  private

  # 操作説明を表示
  def put_command_info
    puts <<~EOS
           ----------------------------------
            a: 追加  d: 削除  i: 一覧  q: 終了
           ----------------------------------
         EOS
  end

  # 操作を選択
  def choose_method
    while (key = STDIN.getch) != "\C-c"
      case key
      when "a"
        return :add
      when "d"
        return :delete
      when "i"
        return :info
      when "q"
        return :quit
      end
    end
  end

  # タスクデータ入力
  def input_task_info
    while true
      print "件名 : "
      title = STDIN.gets.chomp
      print "内容 : "
      content = STDIN.gets.chomp
      break unless title.empty?
      puts change_message_color(message: "件名は入力必須です", color: "red")
    end
    { title: title, content: content }
  end

  # 削除id入力
  def input_delete_id
    print "削除id : "
    id = STDIN.gets.to_i
    { id: id }
  end

  # 操作を実行する
  def execute_method(method:, params: {})
    operation = { method: method }
    case method
    when :add
      task = Task.new params.empty? ? input_task_info : params
      operation.merge!(argment: task)
    when :delete
      delete_id = params.empty? ? input_delete_id : params
      operation.merge!(argment: delete_id)
    when :quit
      puts "ToDoアプリを終了します"
      exit
    end
    self.public_send(*operation.values)
  end
end

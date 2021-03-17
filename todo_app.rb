require "io/console"
require "./task"
require "./todo"

class TodoApp < ToDo
  def initialize(initial_operations)
    super()
    return if initial_operations.empty?
    begin
      initial_operations.each do |operation|
        execute_method(operation)
      end
    rescue => e
      message = "データ読み込み中にエラーが発生しました。\n" << e.message
      puts change_message_color(message: message, color: "red")
      exit
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
    print "件名 : "
    title = STDIN.gets.chomp
    print "内容 : "
    content = STDIN.gets.chomp
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
      params = input_task_info if params.empty?
      error_message = validate_add_params(params)
      unless error_message.empty?
        puts error_message
        return
      end
      task = Task.new(params)
      operation.merge!(argment: task)
    when :delete
      delete_id = params.empty? ? input_delete_id : params
      operation.merge!(argment: delete_id)
    when :quit
      puts "ToDoアプリを終了します"
      exit
    end
    public_send(*operation.values)
  end

  def validate_add_params(title:, content:)
    message = []
    message << "【！】件名を入力してください" if title.empty?
    message << "【！】件名は10文字以内です" if title.length > 10
    message << "【！】内容は40文字以内です" if content.length > 40
    message.empty? ? "" : change_message_color(message: message.join("\n"), color: "red")
  end
end

require "io/console"

class TodoInterface
  def start
    command_info

    # メソッド選択
    method = choose_method
    case method
    when :add
      { method: method }.merge!(input_task_info)
    when :delete
      { method: method }.meage!(input_delete_id)
    when :info, :quit
      { method: method }
    end
  end

  private

  def command_info
    puts <<~EOS
           ---------------------------------
           【操作を選択して下さい】
           a: 追加  d: 削除  i: 一覧  q: 終了
           ---------------------------------
         EOS
  end

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

  def input_task_info
    while true
      print "題名 : "
      title = STDIN.gets.chomp
      print "内容 : "
      content = STDIN.gets.chomp
      break unless title.empty?
      puts "題名は入力必須です"
    end
    { title: title, content: content }
  end

  def input_delete_id
    print "削除id : "
    id = STDIN.gets.to_i
    { id: id }
  end
end

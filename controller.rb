require "io/console"

class Controller
  def initialize
    @operation = {}
  end

  def input
    command_info

    while (key = STDIN.getch) != "\C-c"
      case key
      when "a"
        puts "add"
      when "d"
        puts "delete"
      when "i"
        return :info
      when "q"
        return :quit
      end
    end
    print ""
  end

  def command_info
    puts <<~EOS
           操作を選択して下さい
           a: 追加  d: 削除  i: 一覧  q: 終了
         EOS
  end
end

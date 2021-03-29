require "io/console"
require "byebug"

class ManualInterface
  # 手動入力
  def input
    put_command_info
    return input_operation
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
  def input_operation
    while (key = STDIN.getch) != "\C-c"
      case key
      when "a"
        return { method: :add, params: input_task_info }
      when "d"
        return { method: :delete, params: input_delete_id }
      when "i"
        return { method: :info }
      when "q"
        return { method: :quit }
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
end

require "./todo_app"

# チャレンジ課題の動作確認
def get_demo_operations
  [{ method: :add, params: { title: "洗濯", content: "7時までに干し終える" } },
   { method: :add, params: { title: "仕事", content: "9時〜18時" } },
   { method: :info },
   { method: :delete, params: { id: 1 } },
   { method: :add, params: { title: "買物", content: "卵，ヨーグルト" } },
   { method: :delete, params: { id: 4 } },
   { method: :delete, params: { id: 3 } },
   { method: :info }]
end

def main(manual)
  todo_app = TodoApp.new
  if manual
    todo_app.manual
  else
    get_demo_operations.each do |demo_operation|
      todo_app.execute(**demo_operation)
    end
  end
end

main ARGV.include?("manual") ? true : false

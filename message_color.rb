module MessageColor
  COLOR_CODE = { "red" => 31,
                 "green" => 32,
                 "yellow" => 33,
                 "blue" => 34,
                 "purple" => 35,
                 "cyan" => 36 }
  # 文字色を変更する
  def change_message_color(message:, color:)
    "\e[#{COLOR_CODE[color]}m" << message << "\e[0m"
  end
end

class Task
  attr_reader :id, :title, :content

  @@count = 0

  def initialize(title:, content:)
    @id = @@count += 1
    @title = title
    @content = content
  end

  # タスク情報の表示
  def info
    puts "[No.#{@id}] #{@title}: #{@content}"
  end
end

class Task
  attr_reader :id, :title, :content

  @@count = 0

  def initialize(params)
    @id = @@count += 1
    @title = params[:title]
    @content = params[:content]
  end

  def info
    puts "[No.#{@id}] #{@title}: #{@content}"
  end
end

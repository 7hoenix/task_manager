class Task
  attr_reader :id,
              :title,
              :description
  def initialize(task)
    @id          = task.fetch("id")
    @title       = task.fetch("title")
    @description = task.fetch("description")
  end
end

require_relative "../test_helper"

class TaskTest < Minitest::Test
  def test_it_assigns_the_proper_attributes
    attributes = {"id" => 1, "title" => "sweet title", "description" => "good description"}
    task = Task.new(attributes)

    assert_equal 1, task.id
    assert_equal "sweet title", task.title
    assert_equal "good description", task.description
  end
end

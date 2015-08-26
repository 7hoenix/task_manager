require_relative "../spec_helper"

RSpec.describe Task do
  describe "attributes" do
    it "assigns the proper attributes" do
    attributes = { "id" => 1,
                   "title" => "sweet title",
                   "description" => "good description"
    }
      task = Task.new(attributes)

      expect(task.id).to eq(1)
      expect(task.title).to eq("sweet title")
      expect(task.description).to eq("good description")
    end
  end
end

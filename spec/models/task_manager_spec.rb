require_relative "../spec_helper"

RSpec.describe TaskManager do
  describe "#create" do
    it "creates a task" do
      attributes = { :id => 1,
                     :title => "sweet title",
                     :description => "good description"
      }
      TaskManager.create(attributes)
      task = TaskManager.find(1)

      expect(task.id).to eq(1)
      expect(task.title).to eq("sweet title")
      expect(task.description).to eq("good description")
    end
  end
end

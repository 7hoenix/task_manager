require_relative "../spec_helper"

RSpec.describe TaskManager do
  before :each do
    TaskManager.delete_all
  end

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

  describe "#all" do
    it "returns all instances of Task" do
      attributes = { :id => 1,
                     :title => "sweet title",
                     :description => "good description"
      }
      TaskManager.create(attributes)

      moar_attributes = { :id => 2,
                     :title => "other title",
                     :description => "better description"
      }
      TaskManager.create(moar_attributes)

      expected = TaskManager.all

      expect(expected.map { |task| task.id }).to eq([1, 2])
    end
  end
end

require_relative "../spec_helper"

RSpec.describe TaskManager do
  before :each do
    TaskManager.delete_all
  end

  describe "#create" do
    it "creates a task" do
      attributes = { :title => "sweet title",
                     :description => "good description"
      }
      task1 = TaskManager.create(attributes)
      task = TaskManager.find(task1.id)

      expect(task.id).to eq(task1.id)
      expect(task.title).to eq("sweet title")
      expect(task.description).to eq("good description")
    end
  end

  describe "#all" do
    it "returns all instances of Task" do
      attributes = { :title => "sweet title",
                     :description => "good description"
      }
      task1 = TaskManager.create(attributes)

      moar_attributes = { :title => "other title",
                     :description => "better description"
      }
      task2 = TaskManager.create(moar_attributes)

      expected = TaskManager.all

      expect(expected.map { |task| task.id }).to eq([task1.id, task2.id])
    end
  end

  describe "#find" do
    it "returns the object being searched for" do
      attributes = { :title => "sweet title",
                     :description => "good description"
      }
      TaskManager.create(attributes)

      moar_attributes = { :title => "other title",
                     :description => "better description"
      }
      task2 = TaskManager.create(moar_attributes)

      expected = TaskManager.find(task2.id)

      expect(expected.title).to eq("other title")
      expect(expected.description).to eq("better description")
    end
  end

  describe "#update" do
    it "changes the values of the object" do
      moar_attributes = { :title => "other title",
                          :description => "better description"
      }
      task = TaskManager.create(moar_attributes)

      task.title = "different title"
      task.description = "different description"

      TaskManager.update(task.id, task)

      expected = TaskManager.find(task.id)

      expect(expected.title).to eq("different title")
      expect(expected.description).to eq("different description")
    end
  end

  describe "#destroy" do
    it "destroys the given task" do
      attributes = { :title => "sweet title",
                     :description => "good description"
      }
      task = TaskManager.create(attributes)

      moar_attributes = { :title => "other title",
                     :description => "better description"
      }
      TaskManager.create(moar_attributes)

      expect(TaskManager.all.count).to eq(2)

      TaskManager.delete(task.id)

      expect(TaskManager.all.count).to eq(1)
    end
  end
end

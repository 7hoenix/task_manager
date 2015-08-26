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

  describe "#find" do
    it "returns the object being searched for" do
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

      expected = TaskManager.find(2)

      expect(expected.title).to eq("other title")
      expect(expected.description).to eq("better description")
    end
  end

  describe "#update" do
    it "changes the values of the object" do
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

      even_moar_attributes = { :title => "moar different title",
                     :description => "moar different description"
      }
      TaskManager.update(2, even_moar_attributes)

      expected = TaskManager.find(2)

      expect(expected.title).to eq("moar different title")
      expect(expected.description).to eq("moar different description")
    end
  end

  describe "#destroy" do
    it "destroys the given task" do
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

      expect(TaskManager.all.count).to eq(2)

      TaskManager.delete(2)

      expect(TaskManager.all.count).to eq(1)
      expect(TaskManager.all.last.title).to eq("sweet title")
    end
  end
end

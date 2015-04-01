require 'spec_helper'

describe TodoList do
  it { should have_many(:todo_items) }
  
  describe "#has_completed_items?" do 
    it "is false when completed is done" do 
      todo_item.completed_at = nil
      expect(todo_item.completed?).to be_false
    end
  end
end

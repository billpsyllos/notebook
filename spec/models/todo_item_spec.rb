require 'spec_helper'

describe TodoItem do
  it { should belong_to(:todo_list) } 
  
  describe "#completed?" do 
    it "is false when completed is done" do 
      todo_item.completed_at = nil
      expect(todo_item.completed?).to be_false
    end
  end
 
end

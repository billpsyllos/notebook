require 'spec_helper'

describe "Adding todo items" do
  let!(:todo_list) { TodoList.create(title: "Grocery list", description: "Groceries") }
  let!(:todo_item) { todo_list.todo_items.create(content: "Milk") }

  it "Is succesfull when an item has marked" do 
    visit_todo_list todo_list
    within dom_id_for(todo_item) do 
      click_link "Mark Completed"
    end
    todo_item.reload
    expect(todo_item.completed_at).to_not be_nill
  end
  context "with completed items" do
    let!(:completed_todo_item) { todo_list.todo_items.create(content: "Milk", completed_at: "5.minutes.ago") }
    
    it "Show's completed items as completed" do
      visit_todo_list todo_list
      within dom_it_for(completed_todo_item) do 
        expect(page).to have_content(completed_todo_item.completed_at)
      end
    end
    
    it "Doesn 't give the option to mark completed" do 
      visit_todo_list todo_list
      within dom_it_for(completed_todo_item) do 
        expect(page).to_not have_content("Mark Completed")
      end
    end
  end
  
end

require 'spec_helper'

describe "Adding todo items" do
  let!(:todo_list) { TodoList.create(title: "Grocery list", description: "Groceries") }
  let!(:todo_item) { todo_list.todo_items.create(content: "Milk") }

  it "is succesfull with valid content" do
    visit_todo_list(todo_list)
    within "#todo_item_#{todo_item.id}" do
      click_link 'Edit'      
    end
    fill_in "Content", with: "It a lot of milk"
    click_button "Save"
    expect(page).to have_content("success")
    todo_item.reload
    expect(todo_item.content).to eq("It a lot of milk")
  end
  it "is not succesfull with no content" do
    visit_todo_list(todo_list)
    within "#todo_item_#{todo_item.id}" do
      click_link 'Edit'      
    end
    fill_in "Content", with: ""
    click_button "Save"
    expect(page).to have_content("Content can't be blank")    
  end

end
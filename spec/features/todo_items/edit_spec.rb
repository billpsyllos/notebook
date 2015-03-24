require 'spec_helper'

describe "Adding todo items" do
  let!(:todo_list) { TodoList.create(title: "Grocery list", description: "Groceries") }
  let!(:todo_item) { todo_item.create(content: "Milk") }

  def visit_todo_list(list)
    visit "/todo_lists"
    within "#todo_list_#{list.id}" do
      click_link "List Items"
    end
  end
  
  it "is succesfull with valid content" do
    visit_todo_list(todo_list)
    within "#todo_item_#{todo_item.id}" do
      click_ling 'Edit'
      fill_in "Content", with: "It a lot of milk"
    end
    click_button "Save"
    expect(page).to have_content("Saved todo list item.")
    todo_item.reload
    expect(todo_item.content).to eq("It a lot of milk")
  end

end
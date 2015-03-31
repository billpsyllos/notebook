require 'spec_helper'

describe "Adding todo items" do
  let!(:todo_list) { TodoList.create(title: "Grocery list", description: "Groceries") }
  
  it "is succesfull with valid content" do
    visit_todo_list(todo_list)
    click_link 'Create New Item'
    fill_in "Content", with: 'Milk'
    click_button "Save"
    expect(page).to have_content("success")
    within ('ul.todo_items') do 
      expect(page).to have_content("Milk")
    end
  end
  
  it "display an error with no content" do
    visit_todo_list(todo_list)
    click_link 'Create New Item'
    fill_in "Content", with: ''
    click_button "Save"
    
    within ('div.flash') do 
      expect(page).to have_content("error")
    end
    expect(page).to have_content("Content can't be blank Content")
  end
  
  it "display an error with content less than 2 charackters" do
    visit_todo_list(todo_list)
    click_link 'Create New Item'
    fill_in "Content", with: 'a'
    click_button "Save"
    
    within ('div.flash') do 
      expect(page).to have_content("error")
    end
    expect(page).to have_content("Content is too short (minimum is 2 characters)")
  end


end
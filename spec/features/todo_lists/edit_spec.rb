require 'spec_helper'

describe 'Creating todo lists' do
  let!(:todo_list){TodoList.create(title:"New title",description: "My new todo list")}
  
  def update_todo_list(options = {})
    options[:title] ||= 'My todo list'
    options[:description] ||= 'This is my todo list..!'
    todo_list = options[:todo_list]
    visit "/todo_lists"
    within "#todo_list_#{todo_list.id}" do
        click_link "Edit"
    end

    fill_in "Title" , with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Update Todo list"
  end
  it 'Update a todo list succesfully using correct informations' do   
      update_todo_list todo_list: todo_list, 
                        title: 'New Title',
                        description: 'Updated...yeahhhh!!!'
    
      todo_list.reload
      expect(page).to have_content('Todo list was successfully updated.')
      expect(todo_list.title).to eq("New Title")
      expect(todo_list.description).to eq("Updated...yeahhhh!!!")
  end
  it 'Display an error with no title' do
      update_todo_list todo_list: todo_list, title: ''
      expect(page).to have_content('error')
  end
  it 'Display an error with no description' do
      update_todo_list todo_list: todo_list, description: ''
      expect(page).to have_content('error')
  end
  it 'Display an error with short description' do
      update_todo_list todo_list: todo_list, description: 'Foo'
      expect(page).to have_content('error')
  end
  it 'Display an error with short title' do
      update_todo_list todo_list: todo_list, description: 'Foo'
      expect(page).to have_content('error')
  end
  
end
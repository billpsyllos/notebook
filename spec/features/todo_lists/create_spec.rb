require 'spec_helper'

describe 'Creating todo lists' do
  def create_todo_list(options = {})
    options[:title] ||= 'My todo list'
    options[:description] ||= 'This is my todo list..!'
    
    visit '/todo_lists'
    click_link 'New Todo list'
    expect(page).to have_content('New todo_list')

    fill_in 'Title' , with: options[:title]
    fill_in 'Description' , with: options[:description]
    click_button 'Create Todo list'
  end
  
    it 'redirect index page on succes' do
      
      create_todo_list
      expect(page).to have_content('My todo list')\
    end
    
    it 'Displays an error when a todo list has not a title' do
      expect(TodoList.count).to eq(0);
      create_todo_list title:''
      expect(page).to have_content('error')
      
      visit '/todo_lists'
      expect(TodoList.count).to eq(0);     
    end
    it 'Displays an error when a todo list has not a description' do
      expect(TodoList.count).to eq(0);
      create_todo_list description:''
      expect(page).to have_content('error')
      
      visit '/todo_lists'
      expect(TodoList.count).to eq(0);     
    end
    it 'Displays an error when a todo list description is less than 5 characters' do
      expect(TodoList.count).to eq(0);
      create_todo_list description:'Food'
      expect(page).to have_content('error')
      
      visit '/todo_lists'
      expect(TodoList.count).to eq(0);     
    end
  
end
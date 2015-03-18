require 'spec_helper'

describe 'Creating todo lists' do
      it 'redirect index page on succes' do
      visit '/todo_lists'
      click_link 'New Todo list'
      expect(page).to have_content('New todo_list')

      fill_in 'Title' , with: 'My todo list'
      fill_in 'Description' , with: 'This is what i am doing.'
      click_button 'Create Todo list'

      expect(page).to have_content('My todo list')\
    end
    
    it 'Displays an error when a todo list has not a title' do
      expect(TodoList.count).to eq(0);
      visit '/todo_lists'
      click_link 'New Todo list'
      expect(page).to have_content('New todo_list')
    
      fill_in 'Title' , with: ''
      fill_in 'Description' , with: 'This is what i am doing.'
      click_button 'Create Todo list'
      expect(page).to have_content('error')
      
      visit '/todo_lists'
      expect(TodoList.count).to eq(0);     
    end
    it 'Displays an error when a todo list has not a description' do
      expect(TodoList.count).to eq(0);
      visit '/todo_lists'
      click_link 'New Todo list'
      expect(page).to have_content('New todo_list')
    
      fill_in 'Title' , with: 'Hi'
      fill_in 'Description' , with: ''
      click_button 'Create Todo list'
      expect(page).to have_content('error')
      
      visit '/todo_lists'
      expect(TodoList.count).to eq(0);     
    end
    it 'Displays an error when a todo list description is less than 5 characters' do
      expect(TodoList.count).to eq(0);
      visit '/todo_lists'
      click_link 'New Todo list'
      expect(page).to have_content('New todo_list')
    
      fill_in 'Title' , with: 'Hi'
      fill_in 'Description' , with: 'Food'
      click_button 'Create Todo list'
      expect(page).to have_content('error')
      
      visit '/todo_lists'
      expect(TodoList.count).to eq(0);     
    end
  
end
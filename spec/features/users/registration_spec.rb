require 'spec_helper'

describe "Signing up" do
  it "allow user to make sing up for the site and create an object" do
    expect(User.count).to eq(0)
    
    visit "/"
    expect(page).to have_content("Sign Up")
    click_link "Sign Up"
    
    fill_in "First name" , with: "billaros"
    fill_in "Last name" , with: "psyllaros"
    fill_in "Email" , with: "billaros@gmail.com"
    fill_in "Password" , with: "billaros12345"
    fill_in "Password confirmation" , with: "billaros12345"
    click_button "Sign Up"
    
    expect(User.count).to eq(1)
  end
end
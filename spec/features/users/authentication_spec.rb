require "spec_helper"

describe "Logging In" do
  it "logs the user in and goes to the todo lists" do
    User.create(first_name: "billaros", last_name: "psyllos", email: "bill@gmail.com", password: "pas1234", password_confirmation: "pas1234")
    visit new_user_session_path
    fill_in "Email Address", with: "bill@gmail.com"
    fill_in "Password", with: "pas1234"
    click_button "Log In"
    
    expect(page).to have_content("Todo Lists")
    expect(page).to have_content("Thanks for logging in!")
  end

  it "diplays the email address in the event of a failed login" do
    User.create(first_name: "billaros", last_name: "psyllos", email: "bill@gmail.com", password: "pas1234", password_confirmation: "pas1234")
    visit new_user_session_path
    fill_in "Email Address", with: "bill@gmail.com"
    fill_in "Password", with: "incorrect"
    click_button "Log In"

    expect(page).to have_content("Please check your email and password")
    expect(page).to have_field("Email Address", with: "bill@gmail.com")
  end
end
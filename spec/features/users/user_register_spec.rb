require 'rails_helper'
#new user register
RSpec.describe "user registration page" do 
  it "has a form to register" do 

    visit "/register"

    expect(page).to have_field(:name)
    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_button("Register")
  end

  it "should take the user to their dashboard page after they register" do 

    visit "/register"

    fill_in :name, with: "Sam Smith"
    fill_in :email, with: "sam@smith.com"
    fill_in :password, with: "Password123!"
    fill_in :password_confirmation, with: "Password123!"
    click_on "Register"

    new_user = User.first 

    expect(current_path).to eq("/users/#{new_user.id}")
    expect(new_user.email).to eq("sam@smith.com")
  end

  it "should not register the user if the email address is already in use" do 
    visit "/register"

    new_user = User.create(name: "Jane Doe", email: "sam@smith.com")
    fill_in :name, with: "Jane Doe"
    fill_in :email, with: "sam@smith.com"
    click_on "Register"
    expect(current_path).to eq("/register")
  end
end

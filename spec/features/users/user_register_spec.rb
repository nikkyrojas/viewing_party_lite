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
  it "should not register if field is missing" do 

    visit "/register"

    fill_in :name, with: "Sam Smith"
    fill_in :password, with: "Password123!"
    fill_in :password_confirmation, with: "Password123!"
    click_on "Register"

    expect(current_path).to eq("/register")
  end
  
  it "should not register if email exist" do 
    user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com", password: "Password123!")

    visit "/register"

    fill_in :name, with: "Sam Smith"
    fill_in :email, with: "user1@gmail.com"
    fill_in :password, with: "Password123!"
    fill_in :password_confirmation, with: "Password123!"
    click_on "Register"

    expect(current_path).to eq("/register")
  end
  
  it "should not register if passwords dont match" do 
    visit "/register"

    fill_in :name, with: "Sam Smith"
    fill_in :email, with: "user1@gmail.com"
    fill_in :password, with: "Password123!"
    fill_in :password_confirmation, with: "Password133!"
    click_on "Register"

    expect(current_path).to eq("/register")
  end
end
# As a visitor 
# When I visit `/register`
# and I fail to fill in my name, unique email, OR matching passwords,
# I'm taken back to the `/register` page
# and a flash message pops up, telling me what went wrong
#non matching passwords break site
require 'rails_helper'

RSpec.describe "reigister a user", type: :feature do
    it 'register a user created new user with name email password, confirm password' do
        user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")
        user2 = User.create!(name: "Kobe Bryant", email: "user2@gmail.com")

        visit "/register"


    end
end

#    As a visitor 
# When I visit `/register`
# I see a form to fill in my name, email, password, and password confirmation.
# When I fill in that form with my name, email, and matching passwords,
# I'm taken to my dashboard page `/users/:id`
require 'rails_helper'

describe "testing login functionality" do 
	let!(:user) { User.create(first_name: "Joe",
														last_name: "Antonakakis",
														email: "joe@example.com",
														password: "password",
														password_confirmation: "password") }

	it "logging in" do 
		expect(User.count).to eq(1)
		visit ''
		click_link 'Sign IN'
		fill_in 'Email', with: "joe@example.com"
		fill_in 'Password', with: "password"
		click_button "Login"
		expect(page).to have_content("Write a POST")
		# It's not redirecting with successful login

	end 
end 
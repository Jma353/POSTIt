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

	it "use" do 
		expect(User.count).to eq(1)
		visit ''
		click_link 'Sign IN'
		fill_in 'Email', with: "joe@example.com"
		fill_in 'Password', with: "password"
		click_button ""
		expect(page).to have_content("Write a POST")
		click_link "Write a POST"
		fill_in 'Postname', with: "My first post"
		fill_in "largeInput", with: "This is the content of my first post"
		click_button "Submit"
		expect(page).to have_content("My first post")
	end 

end 
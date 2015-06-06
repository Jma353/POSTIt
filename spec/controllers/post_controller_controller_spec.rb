require 'rails_helper'

describe "Tests PostControllerMethods" do 
	it "takes to new page" do 
		visit '/posts/index'
		click_link "Write a POST"
		expect(page).to have_content("New Post")
	end

	it "displays proper error" do 
		visit "/posts/index"
		click_link "Write a POST"
		fill_in "Postname", with: "My post is here"
		fill_in "largeInput", with: "" # Must name it by its class
		fill_in "Poster", with: ""
		click_button "Submit" 
		expect(page).to have_content("error")
		fill_in "Postname", with: "My post is here"
		fill_in "largeInput", with: "HERE IS A PROPER POST" # Must name it by its class
		fill_in "Poster", with: "WHATEVER"
		click_button "Submit"
		expect(page).to have_content("Nice post!") 
		# Referencing flash; indicates the post went through 
	end 

end 

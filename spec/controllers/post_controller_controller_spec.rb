require 'rails_helper'

describe "Tests PostControllerMethods" do 
	it "takes to new page" do 
		visit '/post_controller/index'
		click_link "Write a POST"
		expect(page).to have_content("New Post")
	end
end 

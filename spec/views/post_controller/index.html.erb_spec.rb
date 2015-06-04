require 'rails_helper'

describe "Tests the content of PostController's Index view" do 
	it "Makes sure h1 is proper" do
		visit '/post_controller/index' 
		expect(page).to have_selector('h1', "Welcome!")
	end 

	
end 
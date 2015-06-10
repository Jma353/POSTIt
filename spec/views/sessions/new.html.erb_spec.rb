require 'rails_helper'

RSpec.describe "sessions/new.html.erb", :type => :view do
	it "Goes to NEW and checks content" do 
		visit '/login' 
		expect(page).to have_content('#new')
	end
end

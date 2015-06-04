require 'rails_helper'

describe "Testing post model to see... " do 

	it "if it rejects short postNames" do 
		Post.create(postName: "", content: "This is my content", poster: "I'm a poster")
		expect(Post.count).to eq(0)

	end 

end 

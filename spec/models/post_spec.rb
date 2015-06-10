require 'rails_helper'

describe "Testing post model to see... " do 

	let!(:post) { Post.create(postName: "My post name", content: "This is my content here") } 

	it "if it rejects short postNames" do 
		Post.create(postName: "", content: "This is my content", poster: "I'm a poster")
		expect(Post.count).to eq(1)
		# Equals the post we established above 

	end 

	it "should have one user" do 
		post.should belong_to(:user)
	end 

end 

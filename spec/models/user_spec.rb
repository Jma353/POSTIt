require 'rails_helper'

describe "Testing Unique Email" do 
	let!(:user) { User.create(first_name: "Joe", 
														last_name: "Antonakakis", 
														email: "joe@example.com", 
														password: "example123", 
														password_confirmation: "example123") }
	# Above physically CREATES a user for the database

	it "Doesn't allow saving for user with the same email as a user that already exists" do 
		user = User.new(first_name: "Joe", 
										last_name: "Antonakakis", 
										email: "joe@example.com", 
										password: "example123", 
										password_confirmation: "example123")
		user.save
		expect(User.count).to eq(1)
	end 

	it "Allows saving for a user with a DIFFERENT email than a user that already exists" do 
		user = User.new(first_name: "Joe", 
										last_name: "Antonakakis",
										email: "joe1@example.com",
										password: "example123",
										password_confirmation: "example123")
		user.save 
		expect(User.count).to eq(2)
	end 

end

describe "Testing Validations" do 
	let!(:user) { User.create(first_name: "Joe", 
														last_name: "Antonakakis", 
														email: "joe@example.com", 
														password: "example123", 
														password_confirmation: "example123") }

	it "Tests email validations (presence)" do 
		expect(user).to validate_presence_of(:email)
		user.email = "lol@email.com"
	end 

	it "Tests email validations (uniqueness)" do 
		expect(user).to validate_uniqueness_of(:email) 
		user.email = "sample@exampe.com"
	end 

	it "Tests email format" do 
		user.email = "incorrect@lol" 
		expect(user).to_not be_valid
	end 

	it "User should have many posts" do 
		user.should have_many(:posts)
	end 
	
	
end 
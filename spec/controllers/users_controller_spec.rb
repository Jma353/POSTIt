require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "Routing tests" do 
    it "new" do 
      expect(get: users_new_path).to route_to(controller: "users", action: "new")
    end 
    subject { get :new }
    # ABOVE MUST BE OUTSIDE OF THE IT BLOCK 
    it "new 2" do 
      expect(subject).to render_template(:new)
    end 
  end 

  describe "POST tests" do 
    let(:valid_attributes) { 
      {
        first_name: "Joe", 
        last_name: "Antonakakis",
        email: "joe@example.com",
        password: "password123",
        password_confirmation: "password123"

      }
    }
    it "post invalid information and expect rerender" do 
      valid_attributes.merge!(email: "user@invalid")
      puts valid_attributes
      post :create, { user: valid_attributes }
      response.should render_template("new")
    end 

    it "post valiid information and expect redirect" do 
      puts valid_attributes
      post :create, user: valid_attributes
      response.should redirect_to(posts_index_path)
    end

    it "valid post actually creates a user" do 
      expect(User.count).to eq(0)
      post :create, user: valid_attributes
      expect(User.count).to eq(1)
    end 

    it "invalid post does not create user" do 
      expect(User.count).to eq(0)
      valid_attributes.merge!(email: "invalid@lol")
      post :create, user: valid_attributes
      expect(User.count).to eq(0)
    end 
  end 


end 

require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "GET new tests" do 

    subject { get :new }
    it "GET new properly" do 

      expect(subject).to render_template('new')

    end 

    it "GET new properly round 2" do 
      get :new
      expect(response).to render_template('new')
    end

    # Either one works 

  end 


  describe "POST create tests" do 
    let!(:valid_params) {
      {
        first_name: "Joe", 
        last_name: "Antonakakis",
        email: "joe@example.com",
        password: "password",
        password_confirmation: "password"
      }

    }
    let!(:user) { User.create(valid_params) }
      
    it "posts valid info and gets redirect" do 
      post :create, session: { email: "joe@example.com", 
                               password: "password" } 
    expect(response).to redirect_to(root_path)
    end 

    it "posts invalid info and gets rendering of new" do 
      post :create, session: { email: "joe@example1.com",
                               password: "password" }
      expect(response).to render_template :new
      expect(flash[:error]).to eq("Invalid email or password")
    end 

  end 
end

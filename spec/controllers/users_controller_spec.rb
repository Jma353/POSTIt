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

end 

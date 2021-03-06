class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email])
  	if user && user.authenticate(params[:session][:password]) 
  		session[:user_id] = user.id
  		redirect_to root_path
  	else
  		flash.now[:error] = "Invalid email or password"
  		render action: 'new'
  	end
  end

  def destroy 
    if session[:user_id] != nil
      session[:user_id] = nil
      redirect_to root_path
    end 
  end 
end

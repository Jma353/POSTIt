class UsersController < ApplicationController
  def new

  	@user = User.new 
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash.now[:success] = "Thank you for signing up! Have fun posting!"
  		redirect_to posts_index_path
  	else 
  		render action: 'new'
  		flash[:danger] = "Errors exist"
  	end 
  end

  private 
  	def user_params 
  		params.require(:user).permit( :first_name, 
  																	:last_name, 
  																	:email, 
  																	:password, 
  																	:password_confirmation )
  	end

end

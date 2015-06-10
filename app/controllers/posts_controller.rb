class PostsController < ApplicationController
 
  def index
  	@posts = Post.all
  end

  def new 
  	@post = Post.new
  end 

  def create
    @user = User.find(session[:user_id])
  	@post = @user.posts.create(post_params)
    # Makes a post associated w/a user
  	if @post.save
  		flash[:success] = "Nice post!"
  		redirect_to root_path 
  	else 
  		render 'new'
  	end 
  end 

  private 

  	def post_params
  		params.require(:post).permit(:postName, :content)
  	end

end

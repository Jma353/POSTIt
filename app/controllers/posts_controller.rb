class PostsController < ApplicationController
 
  def index
  	@posts = Post.all
  end

  def new 
  	@post = Post.new
  end 

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		flash[:success] = "Nice post!"
  		redirect_to root_path 
  	else 
  		render 'new'
  	end 
  end 

  private 

  	def post_params
  		params.require(:post).permit(:postName, :content, :poster)
  	end

end

class PostsController < ApplicationController
  before_action :require_login, only: [:logged_in, :new, :create]

  def index
    @posts = Post.all
  end
 
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = session[:current_user_id]
    if @post.save
      redirect_to new_post_path
    else
      render :new
    end
  end

  private
    def require_login
      return true if session[:current_user_id]
      redirect_to new_session_path
    end
    
    def post_params
      params.require(:post).permit(:title, :body)
    end
end

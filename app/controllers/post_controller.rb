class PostController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to new_post_path
    else
      redirect_to :new
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :user)
    end
end

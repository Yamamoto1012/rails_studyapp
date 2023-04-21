class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @id = params[:id]
    @post = Post.find_by(id: params[:id])
  end

  def new
  end

  def create
    @post = Post.new(content: params[:content], user: current_user)

    if @post.save
      redirect_to("/posts")
    else
      flash[:alert] = 'Error'
      redirect_to root_url
    end
  end
end

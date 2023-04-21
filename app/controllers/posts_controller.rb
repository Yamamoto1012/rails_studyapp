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
      redirect_to posts_url
    else
      flash[:alert] = 'Error'
      redirect_to root_url
    end
  end

  def destroy
    @post = Post.find(params[:id])
      if @post.destroy
        redirect_to posts_url
      else
        flash[:alert] = 'Error'
        redirect_to root_url
      end
  end
end

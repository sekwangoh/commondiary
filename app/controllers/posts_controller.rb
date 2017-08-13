class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new()
  end
  def edit
    @post = Post.find(params[:id])
  end
  def create
    @post = Post.create(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :plan, :research, :act, :observe, :evaluate, :reflect)
  end

end

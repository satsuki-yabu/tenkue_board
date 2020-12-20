class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :update, :edit]

  def index
    @posts = Post.all.includes(:user).order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

end


private
  def post_params
      params.require(:post).permit(:content)
  end



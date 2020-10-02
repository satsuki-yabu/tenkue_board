class PostsController < ApplicationController
  
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
    post = Post.new(post_params)
    @post = post
      if @post.save!
        flash[:success] = 'post が正常に投稿されました'
        redirect_to action: :index
      else
        flash.now[:danger] = 'post が投稿されませんでした'
        render :new
      end
    end

  def edit
  end
end


private
    def post_params
        params.require(:post).permit(:content)
    end
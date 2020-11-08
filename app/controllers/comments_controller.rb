class CommentsController < ApplicationController
  before_action :set_post, only: [:create,:edit,:update,:destroy]
  before_action :set_comment, only: [:edit,:update,:destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post_id)
    else
      flash.now[:alert] = "コメントを(140文字以内で)入力してください。"
      render "posts/show"
    end
  end

  def edit
    render "posts/show"
  end
  
  def update
    if @comment.update(comment_params)
      redirect_to @post
    else
      render "posts/show"
    end
  end

  def destroy
    @comment.destroy
    redirect_to @post
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :user_id)
  end
end
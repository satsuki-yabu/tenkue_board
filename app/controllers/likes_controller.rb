class LikesController < ApplicationController
  before_action :set_post
  before_action :log_in_user?
  
  def create
    current_user.likes.create(post_id: @post.id)
  end

  def destroy
    current_user.likes.find_by(id:params[:id]).delete
  end

private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def log_in_user?
    unless user_signed_in?
      flash[:alert] = "新規登録またはユーザーログインが必要です"
      redirect_to new_user_session_path
    end
  end
end

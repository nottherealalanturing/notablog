class LikesController < ApplicationController
  def create
    puts params[:id]
    user = User.find(params[:user_id])
    post = Post.find(params[:id])
    Comment.create(author: user, post:)
  end

  private

  def likes_params
    params.require(:like).permit(:id)
  end
end

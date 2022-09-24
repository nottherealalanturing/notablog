class LikesController < ApplicationController
  def create
    puts params[:id]
    user = User.find(params[:user_id])
    post = Post.find(params[:id])
    new_like = Comment.create(author: user, post:)
    puts 'hello' if new_like
    # redirect_to user_posts_path(2,1)
  end

  private

  def likes_params
    params.require(:like).permit(:id)
  end
end

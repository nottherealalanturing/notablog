class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    new_comment = current_user.comments.new(post:, text: comments_params)

    if new_comment.valid?
      new_comment.save
      redirect_to user_post_path(post.author, post)
    else
      flash[:error] = 'Error creating comments'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @post.comments_counter -= 1
    @comment.destroy!
    @post.save
    flash[:success] = 'You have deleted this comment!'
    redirect_to user_post_path(current_user, @post)
  end

  private

  def comments_params
    params.require(:comment).permit(:text)[:text]
  end
end

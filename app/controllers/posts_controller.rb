class PostsController < ApplicationController
  def index
    @user = get_user_id params[:user_id]
    @posts = @user.posts.includes((:comments))
  end

  def show
    @user = get_user_id params[:user_id]
    @post = @user.posts.includes(comments: [:author]).find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    puts params
    new_post = current_user.posts.new(post_params)
    if new_post.save
      redirect_to post_path(new_post.id)
      flash[:success] = "New post added succesfully."
    else
      render "new"
      flash[:error] = "Error adding a post."
    end
  end

  private
    def get_user_id(user_id)
      if user_id
        User.find(params[:user_id])
      else
        current_user
      end
    end

    def post_params
      params.require(:post).permit(:title, :text)
    end
  
end

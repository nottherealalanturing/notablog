class PostsController < ApplicationController
  def index
    @user = get_user_id params[:user_id]
    @posts = @user.posts.includes((:comments))
  end

  def show
    @user = get_user_id params[:user_id]
    @post = @user.posts.includes(comments: [:author]).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    new_post = Post.new(author: current_user, text: params[:post][:text], title: params[:post][:title]);
    puts new_post.text
    puts new_post.title
    puts new_post.author.name
    puts new_post.valid?
    if new_post.save
      redirect_to post_path(new_post.id)
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
  
end

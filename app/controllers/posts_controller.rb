class PostsController < ApplicationController

  def index
    @posts = Post.all
  end
  def show 
    @post =Post.find(params[:id])
    @comments=@post.comments.includes(:user)
   
  end
  def new
    @post = Post.new
  end

  def create
    @post = current_user.post.build(post_params)

    if @post.save
         redirect_to pages_index_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end
  def destroy
    @post = Post.find(params[:id])
 
    if @post.user == current_user
      @post.destroy
      redirect_to posts_path, notice: 'Post was successfully deleted.'
    else
      redirect_to posts_path, alert: 'You are not authorized to delete this post.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end

  
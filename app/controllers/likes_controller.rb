class LikesController < ApplicationController
  def index
    # Your code for the 'index' action goes here
   create
  
    end
  def create
    if params[:post_id]
      like_post
    elsif params[:comment_id]
      like_comment
    else
      redirect_back(fallback_location: root_path, alert: 'Invalid like request.')
    end
  end

  def like_post
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def like_comment
    @comment = Comment.find(params[:comment_id])
    @like = @comment.likes.create(user: current_user)
    redirect_back(fallback_location: root_path)
  end
end

  

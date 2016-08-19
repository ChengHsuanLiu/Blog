class PostsController < ApplicationController
  def index
    @page_title = 'Articles'
    @posts = Post.available_posts
    @posts = @posts.where(category_id: params[:category_id]) if params[:category_id].present?
  end

  def show
    @post = Post.find(params[:id])
    if !@post.is_public
      flash[:error] = 'This page is not public.'
      redirect_to posts_path
    end
  end
end

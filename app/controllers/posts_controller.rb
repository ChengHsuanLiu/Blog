class PostsController < ApplicationController
  def index
    @page_title = 'Articles'
    @categories = Category.all
    @posts = Post.available_posts.order('created_at DESC')
    @latest_posts = @posts.first(5)
    @posts = @posts.where(category_id: params[:category_id]).order('created_at DESC') if params[:category_id].present?
  end

  def show
    @page_title = 'Article'
    @categories = Category.all
    @latest_posts = Post.available_posts.order('created_at DESC').first(5)
    @post = Post.find(params[:id])
    if !@post.is_public
      flash[:error] = 'This page is not public.'
      redirect_to posts_path
    end
  end
end

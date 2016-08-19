class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admins'

  def index
    @page_title = 'Admin::Articles'
    @posts = Post.where(deleted_at: nil).order('created_at DESC')
  end

  def new
    @page_title = 'Admin::New Article'
    @post = Post.new
  end

  def edit
    @page_title = 'Admin::Edit Article'
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      flash[:success] = 'Successfully create.'
      redirect_to edit_admins_post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      flash[:success] = 'Successfully update.'
      redirect_to edit_admins_post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Successfully destory.'
    redirect_to admins_posts_path
  end

  private

  def posts_params
    params.require(:post).permit(:title, :content, :excerpt, :is_public, :category_id)
  end
end

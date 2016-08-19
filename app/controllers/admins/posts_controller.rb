class Admins::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
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
      redirect_to admins_edit_posts_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @post.d
    flash[:success] = 'Successfully destory.'
    redirect_to admins_posts_path
  end

  private

  def posts_params
    params.require(:post).permit(:title, :content, :excerpt, :is_public, :category_id)
  end
end

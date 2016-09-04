class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @page_title = "Category::#{@category.name}"
    @posts = @category.posts.available_posts.order('created_at DESC')
    @latest_posts = @posts.first(5)
  end
end

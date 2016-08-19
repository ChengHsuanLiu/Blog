class Admins::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @page_title = 'Admin::Categories'
    @categories = Category.all
  end

  def new
    @page_title = 'Admin::New Article'
    @category = Category.new
  end

  def edit
    @page_title = 'Admin::Edit Article'
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(categories_params)
    if @category.save
      flash[:success] = 'Successfully create.'
      redirect_to edit_admins_category_path(@category)
    else
      flash[:error] = @category.errors.full_messages
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(categories_params)
      flash[:success] = 'Successfully update.'
      redirect_to admins_categories_path
    else
      flash[:error] = @category.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = 'Successfully destory.'
    redirect_to admins_categories_path
  end

  private

  def categories_params
    params.require(:category).permit(:name)
  end
end

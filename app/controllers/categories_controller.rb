class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @category = Category.find params[:id]
    @videos = Video.all
  end
end

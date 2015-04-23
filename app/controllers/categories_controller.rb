class CategoriesController < ApplicationController
  def show
    @category = Category.includes(:pages).find params[:id]
  end
end

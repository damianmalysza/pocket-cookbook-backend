class CategoriesController < ApplicationController
  def index
    categories = Category.all.collect {|category| category.name}
    render json: categories
  end
end

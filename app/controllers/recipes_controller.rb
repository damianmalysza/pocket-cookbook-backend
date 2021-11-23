class RecipesController < ApplicationController
  def index
    recipes = Recipe.all
    render json: RecipeSerializer.new(recipes)
  end

  def create

  end
end

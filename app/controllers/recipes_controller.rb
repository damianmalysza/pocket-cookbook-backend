class RecipesController < ApplicationController
  def index
    recipes = Recipe.all
    render json: RecipeSerializer.new(recipes, {fields: {recipe: [:name, :preptime, :cooktime, :servings, :category]}})
  end

  def show
    recipe = Recipe.find(params[:id])
    render json: RecipeSerializer.new(recipe)
  end
  
  def create
    recipe = Recipe.create_from_site_form(params)
    binding.pry
  end
  
  def destroy
    recipe = Recipe.find(params[:id])
    if recipe
      if recipe.destroy
        head :no_content
      else
        render :json => { :errors => recipe.errors.full_messages }
      end
    else
      render :json => { :errors => recipe.errors.full_messages }
    end
  end
  
end

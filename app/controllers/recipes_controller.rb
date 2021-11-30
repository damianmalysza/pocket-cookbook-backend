class RecipesController < ApplicationController
  def index
    recipes = Recipe.all
    render json: RecipeSerializer.new(recipes)
  end
  
  def create
    
  end
  
  def update
    
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

class Recipe < ApplicationRecord
  belongs_to :category
  has_many :recipeingredients, :dependent => :destroy
  has_many :ingredients, through: :recipeingredients
  has_many :recipesteps, :dependent => :destroy

  def self.create_from_site_form(params)
    category = Category.find_by(name: params[:category])
    recipe = Recipe.new(name: params[:name], cooktime:params[:cooktime], preptime:params[:preptime],servings:params[:servings], category: category)
    params[:ingredients].each do |ingredient|
      ingredient = Ingredient.find_or_create_by(name:ingredient[:ingredient])
      quantity = Recipeingredient.create(recipe:recipe,ingredient:ingredient,quantity:ingredient[:quantity],unit:ingredient[:unit])
    end

    params[:directions].each do |direction|
      Recipestep.create(step_number:direction[:step_number],direction:direction[:direction],recipe:recipe)
    end

    recipe.save
    recipe
  end
end

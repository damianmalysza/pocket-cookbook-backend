class Recipe < ApplicationRecord
  belongs_to :category
  has_many :recipeingredients, :dependent => :destroy
  has_many :ingredients, through: :recipeingredients
  has_many :recipesteps, :dependent => :destroy
  
  validates :name, presence: true
  validates :preptime, presence: true
  validates :cooktime, presence: true
  validates :servings, presence: true
  validates :preptime, numericality: {only_integer: true}
  validates :cooktime, numericality: {only_integer: true}
  validates :servings, numericality: {only_integer: true}
  
  def self.create_from_site_form(params)
    category = Category.find_by(name: params[:category])
    recipe = Recipe.new(name: params[:name], cooktime:params[:cooktime], preptime:params[:preptime],servings:params[:servings], category: category)
    if recipe.save
      params[:ingredients].each do |ingredient|
        new_ingredient = Ingredient.find_or_create_by(name:ingredient[:ingredient])
        if new_ingredient.save 
          quantity = Recipeingredient.new(recipe:recipe,ingredient:new_ingredient,quantity:ingredient[:quantity],unit:ingredient[:unit])
          if !quantity.save
            return quantity
          end
        else
          return new_ingredient
        end
      end
    else 
      return recipe
    end
    
    params[:directions].each do |direction|
      step = Recipestep.new(step_number:direction[:step_number],direction:direction[:direction],recipe:recipe)
      if !step.save
        return step
      end
    end
    # binding.pry
    recipe.save
    recipe
  end
end

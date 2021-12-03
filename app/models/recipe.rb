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
    params[:ingredients].each do |ingredient|
      new_ingredient = Ingredient.find_or_create_by(name:ingredient[:ingredient])
      # if new_ingredient.save 
        quantity = Recipeingredient.new(recipe:recipe,ingredient:new_ingredient,quantity:ingredient[:quantity],unit:ingredient[:unit])
      # else
        # return new_ingredient
      # end
    end

    params[:directions].each do |direction|
      Recipestep.create(step_number:direction[:step_number],direction:direction[:direction],recipe:recipe)
    end
    # binding.pry
    recipe.save
    recipe
  end
end

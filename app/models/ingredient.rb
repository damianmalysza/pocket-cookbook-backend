class Ingredient < ApplicationRecord
  has_many :recipeingredients
  has_many :recipes, through: :recipeingredients
end

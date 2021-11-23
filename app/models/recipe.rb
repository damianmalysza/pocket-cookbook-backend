class Recipe < ApplicationRecord
  belongs_to :category
  has_many :recipeingredients
  has_many :ingredients, through: :recipeingredients
  has_many :recipesteps
end

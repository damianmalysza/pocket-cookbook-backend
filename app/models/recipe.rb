class Recipe < ApplicationRecord
  belongs_to :category
  has_many :recipeingredients, :dependent => :destroy
  has_many :ingredients, through: :recipeingredients
  has_many :recipesteps, :dependent => :destroy
end

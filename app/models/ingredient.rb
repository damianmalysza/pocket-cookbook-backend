class Ingredient < ApplicationRecord
  has_many :recipeingredients
  has_many :recipes, through: :recipeingredients

  validates :name, presence: true
  accepts_nested_attributes_for :recipeingredients
end

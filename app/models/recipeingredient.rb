class Recipeingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :quantity, presence: true
  validates :quantity, numericality: {only_integer: true}

  def ingredient_name
    self.ingredient.name
  end

  #overriding as_json method to be able to pull in ingredient name method from model
  def as_json(options = {})
    options[:methods] = [:ingredient_name] 
    super
  end

end

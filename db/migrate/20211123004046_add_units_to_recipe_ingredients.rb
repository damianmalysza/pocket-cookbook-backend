class AddUnitsToRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :recipeingredients, :unit, :string
  end
end

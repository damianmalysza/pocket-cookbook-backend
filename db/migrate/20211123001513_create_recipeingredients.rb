class CreateRecipeingredients < ActiveRecord::Migration[6.1]
  def change
    create_table :recipeingredients do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end

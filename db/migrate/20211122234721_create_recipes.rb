class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preptime
      t.integer :cooktime
      t.integer :servings

      t.timestamps
    end
  end
end

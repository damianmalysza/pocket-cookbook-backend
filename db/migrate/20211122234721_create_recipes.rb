class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.datetime :preptime
      t.datetime :cooktime
      t.integer :servings

      t.timestamps
    end
  end
end

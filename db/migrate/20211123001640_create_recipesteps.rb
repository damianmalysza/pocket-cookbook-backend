class CreateRecipesteps < ActiveRecord::Migration[6.1]
  def change
    create_table :recipesteps do |t|
      t.references :recipe, null: false, foreign_key: true
      t.integer :step_number
      t.text :direction

      t.timestamps
    end
  end
end

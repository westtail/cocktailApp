class CreateCocktails < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :base_alcohol
      t.string :taste
      t.integer :alcohol_percentage
      t.string :glass_type
      t.string :cocktail_recipe

      t.timestamps
    end
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Faker::Config.random = nil
Faker::Config.random.seed

Recipestep.destroy_all
Recipeingredient.destroy_all
Ingredient.destroy_all
Recipe.destroy_all
Category.destroy_all

#These categories should be seeded in production
breakfast = Category.create(name: "Breakfast")
soup = Category.create(name: "Soup")
sauce = Category.create(name: "Sauce")
appetizer = Category.create(name: "Appetizer")
entree = Category.create(name: "Entree")
dessert = Category.create(name: "Dessert")
beverage = Category.create(name: "Beverage")
misc = Category.create(name: "Miscellaneous")

#test recipe
50.times do 
  recipe = Recipe.create(name: Faker::Food.dish, cooktime: rand(1..300), preptime: rand(1..300), servings: rand(1..12),category: Category.all.sample)
  rand(1..15).times do
    ingredient = Ingredient.create_or_find_by(name: Faker::Food.ingredient)
    quantity = Recipeingredient.create(recipe:recipe,ingredient:ingredient,quantity:rand(1..10),unit:Faker::Food.metric_measurement)
  end
  rand(1..15).times do |count|
    Recipestep.create(step_number:count + 1,direction:Faker::Lorem.sentence(word_count:rand(5..20)),recipe:recipe)
  end
end
# recipe = Recipe.create(name:"scrambled eggs",cooktime:20,category:breakfast)
# ingredient = Ingredient.create(name: "egg")
# quantity = Recipeingredient.create(recipe:recipe,ingredient:ingredient,quantity:3,unit:"eggs")
# step = Recipestep.create(step_number:1,direction:"break some eggs",recipe:recipe)




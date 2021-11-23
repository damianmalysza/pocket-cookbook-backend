# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
recipe = Recipe.create(name:"scrambled eggs",cooktime:20,category:breakfast)
ingredient = Ingredient.create(name: "egg")
quantity = Recipeingredient.create(recipe:recipe,ingredient:ingredient,quantity:3,unit:"eggs")
step = Recipestep.create(step_number:1,direction:"break some eggs",recipe:recipe)

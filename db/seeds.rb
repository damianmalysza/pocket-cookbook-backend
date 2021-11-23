# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
Recipe.destroy_all

#These categories should be seeded in production
breakfast = Category.create(name: "Breakfast")
soup = Category.create(name: "Soup")
sauce = Category.create(name: "Sauce")
appetizer = Category.create(name: "Appetizer")
entree = Category.create(name: "Entree")
dessert = Category.create(name: "Dessert")
beverage = Category.create(name: "Beverage")
misc = Category.create(name: "Miscellaneous")


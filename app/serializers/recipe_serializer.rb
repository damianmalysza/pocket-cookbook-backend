class RecipeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :preptime, :cooktime, :servings, :recipeingredients, :recipesteps, :category

end

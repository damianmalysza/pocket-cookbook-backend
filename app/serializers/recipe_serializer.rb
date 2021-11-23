class RecipeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :preptime, :cooktime, :servings, :category

  attributes :ingredients do |recipe|
    return_array = []
    recipe.recipeingredients.each do |ingredient|
      ingredient_hash = {}
      ingredient_hash[:quantity] = ingredient.quantity
      ingredient_hash[:unit] = ingredient.unit
      ingredient_hash[:ingredient] = ingredient.ingredient_name
      return_array.push(ingredient_hash)
    end
    return_array
  end

  attributes :directions do |recipe|
    return_array = []
    recipe.recipesteps.each do |step|
      step_hash = {}
      step_hash[:step_number] = step.step_number
      step_hash[:direction] = step.direction
      return_array.push(step_hash)
    end
    return_array
  end

  attributes :category do |recipe|
    recipe.category.name
  end

end

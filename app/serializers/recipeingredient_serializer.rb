class RecipeingredientSerializer
  include FastJsonapi::ObjectSerializer
  attributes :ingredient_name,:quantity,:unit 
end

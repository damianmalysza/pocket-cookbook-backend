class RecipestepSerializer
  include FastJsonapi::ObjectSerializer
  attributes :step_number, :direction 
end

class Recipestep < ApplicationRecord
  belongs_to :recipe

  validates :step_number, presence: true
  validates :direction, presence: true
end

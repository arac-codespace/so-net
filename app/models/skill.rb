class Skill < ApplicationRecord
  serialize :skill_hash, Array
  
  belongs_to :user
  
end

class UserInfo < ApplicationRecord
  belongs_to :user
  has_many :educations
  
  # accepts_nested_attributes_for :educations
end

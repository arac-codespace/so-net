class User < ApplicationRecord
  has_one :user_info
  has_many :educations
  # has_many :educations

  # accepts_nested_attributes_for :user_info   
   
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  #Protected attributes for model
  # attr_accessible 
  
end

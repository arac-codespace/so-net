class User < ApplicationRecord
  has_one :user_info
  has_many :educations
  
  # accepts_nested_attributes_for :user_info   
  
  after_create :build_user_info, :build_education
  
  
  def build_user_info
    UserInfo.create(user: self, first_name: self.first_name, last_name: self.last_name) # Associations must be defined correctly for this syntax, avoids using ID's directly.
  end  
  
  def build_education
    Education.create(user: self)
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  #Protected attributes for model
  # attr_accessible 
  
end

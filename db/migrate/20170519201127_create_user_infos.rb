class CreateUserInfo < ActiveRecord::Migration[5.0]
  def change
    create_table :user_infos do |t|
    t.string :country
    t.string :state
    t.string :summary
    t.string :phone
      
    end
  end
end

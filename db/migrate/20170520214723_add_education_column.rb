class AddEducationColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :user_infos, :education, :string    
  end
end

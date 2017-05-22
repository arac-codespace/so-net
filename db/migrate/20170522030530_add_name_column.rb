class AddNameColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :user_infos, :first_name, :string
    add_column :user_infos, :last_name, :string
  end
end

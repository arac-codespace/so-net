class AddHeadlineColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :user_infos, :headline, :string
  end
end

class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.integer :user_id
      t.string :language_name
      t.timestamps
    end
  end
end

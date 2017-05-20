class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.string :school
      t.string :degree
      t.string :field
      t.integer :grade
      t.date :start_date
      t.date :end_date
      t.text :description
      t.integer :user_id
      t.timestamps
    end
  end
end

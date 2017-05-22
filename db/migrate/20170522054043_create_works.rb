class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :company
      t.string :industry
      t.string :job_title
      t.string :description
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end

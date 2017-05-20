class ChangeGradeType < ActiveRecord::Migration[5.0]
  def change
    change_column :educations, :grade, :decimal
  end
end

class AddColumnReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :user_id, :integer, foreign_key: true, null: false
  end
end

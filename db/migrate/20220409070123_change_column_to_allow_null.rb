class ChangeColumnToAllowNull < ActiveRecord::Migration[6.1]
  def up
    change_column :comments, :user_id, :integer, null: true
  end

  def down
    change_column :comments, :user_id, :integer, null: false
  end
end

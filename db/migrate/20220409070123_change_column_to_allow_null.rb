class ChangeColumnToAllowNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:comments, :user_id, true)
    change_column_null(:comments, :commentable_id, true)
    change_column_null(:comments, :commentable_type, true)
  end
end

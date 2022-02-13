class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :post_code, :integer
    add_column :users, :address, :string
    add_column :users, :profile, :text
  end
end

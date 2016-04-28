class AddEmailToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email, :string unless column_exists? :users, :email
    add_index :users, :email, unique: true
  end
end

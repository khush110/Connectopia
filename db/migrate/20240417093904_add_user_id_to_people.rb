class AddUserIdToPeople < ActiveRecord::Migration[7.1]
  def change
    add_column :people, :user_id, :integer
    add_index :people, :user_id
  end
end

class AddCaptionToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :caption, :string
  end
end

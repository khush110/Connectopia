class AddProfilePictureToPeople < ActiveRecord::Migration[7.1]
  def change
    add_column :people, :profile_picture, :string
  end
end

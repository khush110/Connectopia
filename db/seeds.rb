# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Find or create a user and set them as admin
user = User.find_or_create_by(email: 'ranvir3005@gmail.com') do |u|
    u.password = 'Rks@0912' # Set a password for the admin user
    u.admin = true
end
  
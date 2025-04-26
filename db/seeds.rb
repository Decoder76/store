# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# filepath: /home/loki/apps/store/db/seeds.rb

# Ensure the existence of an admin user
User.find_or_create_by!(email_address: 'admin@example.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
end

# Add 50 fake products using the Faker gem
50.times do
  Product.create!(name: Faker::Commerce.product_name)
end

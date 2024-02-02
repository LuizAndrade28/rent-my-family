# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
# end
# User.create!(email: "teste@teste.com", password: "123456", password_confirmation: "123456")
FamilyMember.destroy_all

30.times do
  FamilyMember.create!(first_name: "John", last_name: "Doe", kinship: "Father", description: "I am a father of 3 kids and I love to play with them.", profile_title: "Father", value_hour: 20, available_date: "2024-01-31 00:00:00")
end

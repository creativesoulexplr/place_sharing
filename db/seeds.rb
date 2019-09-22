# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_by_email("admin@test.com")
if user.nil?
	user = User.create(email: "admin@test.com", password: "!QAZxsw2d", username: "admin", display_name: "Admin")
	user.add_role :admin
end

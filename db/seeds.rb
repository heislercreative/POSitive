# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

User.create(email: 'brennan@heislercreative.com', password: 'testpw', business_name: 'Heisler Creative Services', first_name: 'Brennan', last_name: 'Heisler', address: '1234 Wamapoke Way', city: 'Pawnee', state_initials: 'IN', zip: 47424, phone: 5555545555)

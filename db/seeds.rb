# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

heisler_creative = User.create(email: 'brennan@heislercreative.com', password: 'testpw', business_name: 'Heisler Creative Services', first_name: 'Brennan', last_name: 'Heisler', address: '1234 Wamapoke Way', city: 'Pawnee', state_initials: 'IN', zip: 47424, phone: 5555545555)
heisler_creative.sites.create(platform: 'Facebook', profile_url: 'https://www.facebook.com/heislercreative/', active: true, priority: 1)

vanguard_skin = User.create(email: 'brennan@vanguardskin.com', password: 'testpw1', business_name: 'Vanguard Skin Specialists', first_name: 'Brennan', last_name: 'Heisler', address: '9348 Grand Cordera Pwky', city: 'Colorado Springs', state_initials: 'CO', zip: 80924, phone: 5555545554)
vanguard_skin.sites.create([
  {
    platform: 'Facebook', profile_url: 'https://www.facebook.com/VanguardSkin/', active: true, priority: 2
  },
  {
    platform: 'Google', profile_url: 'https://www.google.com/search?client=safari&rls=en&q=vanguard+skin+specialists&ie=UTF-8&oe=UTF-8', active: true, priority: 1
  },
  {
    platform: 'Yelp', profile_url: 'https://www.yelp.com/biz/vanguard-skin-specialists-colorado-springs-2', active: true, priority: 4
  },
  {
    platform: 'Healthgrades', profile_url: 'https://www.healthgrades.com/group-directory/co-colorado/colorado-springs/vanguard-skin-specialists-y7lxt7', active: true, priority: 3
  }
])

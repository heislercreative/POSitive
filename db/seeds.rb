# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Industry.create!(name: 'healthcare')
Industry.create!(name: 'restaurant')


Platform.create!(name: 'google', url: 'www.google.com')
Platform.create!(name: 'facebook', url: 'www.facebook.com')
Platform.create!(name: 'yelp', url: 'www.yelp.com')
Platform.create!(name: 'tripadvisor', url: 'www.tripadvisor.com')
Platform.create!(name: 'grubhub', url: 'www.grubhub.com')
Platform.create!(name: 'healthgrades', url: 'www.healthgrades.com')


health = IndustryPlatform.create!([
  {industry_id: 1, platform_id: 1}, {industry_id: 1, platform_id: 2}, {industry_id: 1, platform_id: 3}, {industry_id: 1, platform_id: 6}
])

rest = IndustryPlatform.create!([
  {industry_id: 2, platform_id: 1}, {industry_id: 2, platform_id: 2}, {industry_id: 2, platform_id: 3}, {industry_id: 2, platform_id: 4}, {industry_id: 2, platform_id: 5}
])

vss = User.create!(email: 'brennan@vanguardskin.com', password: 'testpw1', business_name: 'Vanguard Skin Specialists', first_name: 'Brennan', last_name: 'Heisler', address: '9348 Grand Cordera Pwky', city: 'Colorado Springs', state_initials: 'CO', zip: 80924, phone: 5555545554, industry_id: 1)
vss_1 = vss.locales.create(address: vss.address, city: vss.city, state_initials: vss.state_initials, zip: vss.zip)
vss_1.sites.create([
  {
    platform_id: 2, url: 'https://www.facebook.com/VanguardSkin/', active: true, priority: 2
  },
  {
    platform_id: 1, url: 'https://www.google.com/search?client=safari&rls=en&q=vanguard+skin+specialists&ie=UTF-8&oe=UTF-8', active: true, priority: 1
  },
  {
    platform_id: 3, url: 'https://www.yelp.com/biz/vanguard-skin-specialists-colorado-springs-2', active: true, priority: 4
  },
  {
    platform_id: 5, url: 'https://www.healthgrades.com/group-directory/co-colorado/colorado-springs/vanguard-skin-specialists-y7lxt7', active: true, priority: 3
  }
])

bbq = User.create!(email: 'brennan@heislercreative.com', password: 'testpw2', business_name: 'Bird Dog BBQ', first_name: 'Brennan', last_name: 'Heisler', address: '5984 Stetson Hills Blvd, Ste 200', city: 'Colorado Springs', state_initials: 'CO', zip: 80923, phone: 5555545555, industry_id: 2)
bbq_1 = bbq.locales.create(address: bbq.address, city: bbq.city, state_initials: bbq.state_initials, zip: bbq.zip)

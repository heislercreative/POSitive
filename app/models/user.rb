class User < ApplicationRecord
  has_secure_password
  has_many :locales
  belongs_to :industry
  require 'open-uri'


    # Move to Create route in UsersController
    def slugify
      if !self.slug
        self.update(slug: "#{self.business_name.gsub(/\s+/, "").downcase}")
        puts "Slugified!"
      end
    end

end

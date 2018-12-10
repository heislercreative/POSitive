class User < ApplicationRecord
  has_secure_password
  has_many :sites





  #Scraper Methods
    def self.scrape_yelp
      yelp_site = self.sites.where("platform = 'Yelp'")
      yelp_url = yelp_site.profile_url
      yelp_page = Nokogiri::html(open("#{yelp_url}"))
    end
end

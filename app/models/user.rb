class User < ApplicationRecord
  has_secure_password
  has_many :sites
  require 'open-uri'





  #Scraper Methods
    def scrape_yelp
      yelp_url = self.sites.where(platform: 'Yelp').first.profile_url
      yelp_page = Nokogiri::html(open(yelp_url))
      yelp_title = yelp_page.css("h1.biz-page-title")
      # yelp_rating_div = yelp_page.css("div.biz-rating.biz-rating-very-large.clearfix")
      # yelp_rating = yelp_rating_div.css("div.i-stars").title
      # yelp_rating
      yelp_title
    end
end

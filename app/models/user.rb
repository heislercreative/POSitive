class User < ApplicationRecord
  has_secure_password
  has_many :sites
  require 'nokogiri'
  require 'open-uri'





  #Scraper Methods
    # def scrape_yelp
    #   # yelp_url = self.sites.where(platform: 'Yelp').first.profile_url
    #   yelp_page = Nokogiri::HTML(open("https://www.yelp.com/biz/vanguard-skin-specialists-colorado-springs-2"))
    #   yelp_title = yelp_page.css("h1.biz-page-title").text
    #   # yelp_rating_div = yelp_page.css("div.biz-rating.biz-rating-very-large.clearfix")
    #   # yelp_rating = yelp_rating_div.css("div.i-stars").title
    #   # yelp_rating
    #   yelp_title
    # end

    def scrape_google
      google_page = Nokogiri::HTML(open("https://goo.gl/maps/JpbzkpErtkv"))
      google_rating = google_page.css("span.section-star-display").text
      google_rating
    end
end

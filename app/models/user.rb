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

    # Move to Create route in UsersController
    def slugify
      self.slug = self.business_name.gsub(/\s+/, "").downcase
      puts "Slugified!"
    end

    def scrape_google
      self.slugify if !self.slug
      html = Nokogiri::HTML(open("http://www.google.com/search?num=20&q=#{slug}"))
      google_rating = html.css("span.ul7Gbc").text.to_f
      Site.where("user_id = ? and platform = ?", "#{self.id}", "google").update(rating: google_rating)
    end

    def profile_search
      self.slugify if !self.slug
      html = Nokogiri::HTML(open("http://www.google.com/search?num=20&q=#{slug}"))
      html.search("cite").each do |cite|
        url = cite.inner_text
        if url.include? "facebook"
          puts "Found Facebook profile"
          puts url
          if !Site.find_by(user_id: self.id, platform: "facebook")
            self.sites.create(platform: "facebook", profile_url: "#{url}", active: true)
            puts "Added Facebook profile"
          end
        elsif url.include? "yelp"
          puts "Found Yelp profile"
          puts url
          if !Site.find_by(user_id: self.id, platform: "yelp")
            self.sites.create(platform: "yelp", profile_url: "#{url}", active: true)
            puts "Added Yelp profile"
          end
        elsif url.include? "healthgrades"
          puts "Found Healthgrades profile"
          puts url
        end
      end
    end
end

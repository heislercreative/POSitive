class User < ApplicationRecord
  has_secure_password
  has_many :sites
  belongs_to :industry
  require 'open-uri'

  HEALTHCARE = ["facebook", "yelp", "healthgrades"]
  RESTAURANT = ["facebook", "yelp", "grubhub"]



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
      if !self.slug
        self.slug = self.business_name.gsub(/\s+/, "").downcase
        puts "Slugified!"
      end
    end

    def scrape_google
      self.slugify
      html = Nokogiri::HTML(open("http://www.google.com/search?num=20&q=#{slug}"))
      google_rating = html.css("span.ul7Gbc").text.to_f
      Site.where("user_id = ? and platform = ?", "#{self.id}", "google").update(rating: google_rating)
    end


    def industry_profiles
      self.industry.upcase
    end


    def profile_search
      self.slugify
      html = Nokogiri::HTML(open("http://www.google.com/search?num=20&q=#{slug}"))

      html.search("cite").each do |cite|
        url = cite.inner_text
        RESTAURANT.each do |profile|
          if url.include? "#{profile}"
            puts "Found #{profile.capitalize} profile"
            puts url
            if !Site.find_by(user_id: self.id, platform: "#{profile}", profile_url: "#{url}")
              self.sites.create(platform: "#{profile}", profile_url: "#{url}", active: true)
              puts "Added #{profile.capitalize} profile"
            end
          end
        end
      end
    end

end

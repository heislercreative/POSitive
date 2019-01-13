class Locale < ApplicationRecord
  belongs_to :user
  has_many :sites


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


  def slugify
    if !self.slug
      self.update(slug: "#{self.user.business_name.gsub(/\s+/, "+").downcase}+#{self.address.gsub(/\s+/, "+").gsub(",", "").downcase}")
      puts "Slugified!"
    end
  end
  

  def profile_search
    slugify
    google_search = "http://www.google.com/search?num=20&q=#{slug}"
    google = Platform.find_by(name: 'google')
    if !Site.find_by(locale_id: self.id, platform: google, url: google_search)
      self.sites.create(platform: google, url: google_search, active: true)
      puts "Added Google profile"
    end

    html = Nokogiri::HTML(open(google_search))

    html.search("cite").each do |cite|
      url = cite.inner_text
      self.user.industry.platforms.each do |platform|
        p = platform.url
        if url.include? "#{p}"
          puts "Found #{p.capitalize} profile"
          puts url
          if !Site.find_by(locale_id: self.id, platform: platform, url: "#{url}")
            self.sites.create(platform: platform, url: "#{url}", active: true)
            puts "Added #{p.capitalize} profile"
          end
        end
      end
    end
  end

end

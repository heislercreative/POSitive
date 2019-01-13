class Site < ApplicationRecord
  belongs_to :locale
  belongs_to :platform


  def slugify
    if !self.slug
      self.update(slug: "#{self.url[25...(self.url.length)]}")
      puts "Slugified!"
    end
  end

  def google_info
    html = Nokogiri::HTML(open(self.url))
    rating = html.css("span.ul7Gbc").text.to_f
    self.update(rating: rating)
  end

  def yelp_info
    slugify
    @resp = Faraday.get "https://api.yelp.com/v3/businesses/#{self.slug}" do |req|
      req.headers['Authorization'] = ENV['YELP_API_KEY']
    end
    resp_body = JSON.parse(@resp.body)
    rating = resp_body["rating"]
    review_count = resp_body["review_count"]
    puts rating
    puts review_count
    self.update(rating: rating, review_count: review_count)
  end

end

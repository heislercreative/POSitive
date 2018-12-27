class Platform < ApplicationRecord
  has_many :industry_platforms
  has_many :industries, through: :industry_platforms
  has_many :sites
end

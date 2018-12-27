class Industry < ApplicationRecord
  has_many :users
  has_many :industry_platforms
  has_many :platforms, through: :industry_platforms
end

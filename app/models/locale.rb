class Locale < ApplicationRecord
  belongs_to :user
  has_many :sites
end
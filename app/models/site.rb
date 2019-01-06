class Site < ApplicationRecord
  belongs_to :locale
  belongs_to :platform
end

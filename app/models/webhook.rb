class Webhook < ApplicationRecord
  has_many :handlers
  has_many :events
end

class Event < ApplicationRecord
  belongs_to :webhook
  belongs_to :handler, optional: true
end

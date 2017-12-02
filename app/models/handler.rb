class Handler < ApplicationRecord
  CONDITIONS = %w[actor_type actor_id action object_type object_id success]
  ACTOR_TYPES = %w[User]
  ACTIONS = %w[lock unlock]
  OBJECT_TYPES = %w[Lock]
  SUCCESSES = %w[true false]

  belongs_to :webhook

  validates :name, presence: true
  validates :recipient, email: true
  validates :message, presence: true
  validates :conditions, presence: true

  before_validation :compact_conditions, if: :conditions?

  private

  def compact_conditions
    self.conditions = conditions.select { |key, value| value.present? }
  end
end

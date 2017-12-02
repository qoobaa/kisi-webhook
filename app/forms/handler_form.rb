class HandlerForm
  include ActiveModel::Model

  attr_reader :handler
  attr_accessor :recipient, :message

  validates :recipient, email: true
  validates :message, presence: true

  def initialize(handler, *)
    @handler = handler
    super(*)
  end

  def persist
    return false if invalid?
    @handler.update!(handler_attributes)
  end

  private

  def handler_attributes
    {
      recipient: recipient,
      message: message
    }
  end
end

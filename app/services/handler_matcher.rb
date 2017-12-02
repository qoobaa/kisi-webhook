class HandlerMatcher
  attr_reader :webhook

  def initialize(webhook)
    @webhook = webhook
  end

  def call(payload)
    webhook.handlers.find do |handler|
      Handler::CONDITIONS.all? do |condition|
        handler.conditions[condition].blank? ||
          handler.conditions[condition].to_s == payload[condition].to_s
      end
    end
  end
end

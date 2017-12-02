module API
  class WebhooksController < ActionController::API
    def receive
      webhook = Webhook.find(params[:id])
      event = webhook.events.create!(payload: params.except(:id))
      handler = HandlerMatcher.new(webhook).call(event.payload)
      if handler
        event.update!(handler: handler)
        EventMailer.handler_triggered(event).deliver_now
      end
    end
  end
end

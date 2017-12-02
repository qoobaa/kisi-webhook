class EventMailer < ApplicationMailer
  def handler_triggered(handler)
    @handler = handler
    mail(
      to: handler.recipient,
      subject: "Handler #{handler.name} triggered",
    )
  end
end

class EventMailer < ApplicationMailer
  def handler_triggered(handler)
    @handler = handler
    mail(
      to: handler.email,
      subject: "Handler #{handler.name} triggered",
    )
  end
end

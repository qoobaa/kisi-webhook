class WebhooksController < ApplicationController
  def new
    @webhook = Webhook.new
  end

  def create
    @webhook = Webhook.create!
    redirect_to webhook_handlers_path(@webhook)
  end
end

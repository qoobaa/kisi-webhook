class HandlersController < ApplicationController
  before_action :fetch_webhook

  def index
    @handlers = @webhook.handlers
  end

  def new
    @handler = @webhook.handlers.build
  end

  def create
    @handler = @webhook.handlers.build(handler_params)
    if @handler.save
      redirect_to webhook_handlers_path(@webhook)
    else
      render "new"
    end
  end

  def destroy
    @handler = @webhook.handlers.find(params[:id])
    @handler.destroy
    redirect_to webhook_handlers_path(@webhook)
  end

  private

  def fetch_webhook
    @webhook = Webhook.find(params[:webhook_id])
  end

  def handler_params
    params.require(:handler).permit(:name, :recipient, :message, conditions: Handler::CONDITIONS)
  end
end

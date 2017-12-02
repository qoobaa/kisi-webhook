class Api::WebhooksControllerTest < ActionDispatch::IntegrationTest
  include ActionMailer::TestHelper

  test "creates event" do
    webhook = Webhook.create!

    post api_webhook_url(webhook), params: JSON.load(file_fixture("event1.json"))

    event = Event.last

    assert_equal(webhook, event.webhook)
    assert_nil(event.handler)
  end

  test "assigns handler and sends email" do
    webhook = Webhook.create!

    handler = webhook.handlers.create!(
      name: "Test",
      recipient: "test@example.com",
      message: "WORKS!",
      conditions: {
        "object_type" => "Integration"
      }
    )

    post api_webhook_url(webhook), params: JSON.load(file_fixture("event1.json"))

    event = Event.last

    assert_equal(webhook, event.webhook)
    assert_equal(handler, event.handler)
    assert_emails(1)
  end
end

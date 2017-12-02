require 'test_helper'

class HandlerMatcherTest < ActiveSupport::TestCase
  test "assigns first handler that matches all conditions" do
    webhook = Webhook.create!
    handler1 = webhook.handlers.create!(
      conditions: {"object_id" => "5", "object_type" => "Lock", success: "false"},
      recipient: "test1@example.com",
      message: "Lock!",
      name: "Test 1"
    )
    handler2 = webhook.handlers.create!(
      conditions: {"object_id" => "5", "object_type" => "Lock", success: "true"},
      recipient: "test1@example.com",
      message: "Lock!",
      name: "Test 2"
    )
    payload = {
      "object_id" => "5",
      "object_type" => "Lock",
      "success" => "true"
    }

    assert_equal handler2, HandlerMatcher.new(webhook).call(payload)
  end
end

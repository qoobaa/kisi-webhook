require 'test_helper'

class HandlerTest < ActiveSupport::TestCase
  test "properly parses condition when values given" do
    handler = Handler.new(conditions: {object_type: "Lock", object_id: 1})

    assert_equal({"object_type" => "Lock", "object_id" => 1}, handler.conditions)
  end

  test "properly parses condition when no value given" do
    handler = Handler.new(conditions: {object_type: ""})

    handler.validate

    assert_equal({}, handler.conditions)
  end

  test "properly persists handler when valid attributes given" do
    webhook = Webhook.create!
    handler = webhook.handlers.build(
      conditions: {
        object_type: "Lock",
        action: "unlock"
      },
      recipient: "test@example.com",
      message: "Door unlocked!"
    )

    assert handler.save

    handler.reload

    assert_equal("test@example.com", handler.recipient)
    assert_equal("Door unlocked!", handler.message)
    assert_equal({"object_type" => "Lock", "action" => "unlock"}, handler.conditions)
  end
end

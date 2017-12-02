# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171202105655) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "webhook_id"
    t.bigint "handler_id"
    t.json "payload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["handler_id"], name: "index_events_on_handler_id"
    t.index ["webhook_id"], name: "index_events_on_webhook_id"
  end

  create_table "handlers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "webhook_id"
    t.json "conditions"
    t.string "recipient"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["webhook_id"], name: "index_handlers_on_webhook_id"
  end

  create_table "webhooks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

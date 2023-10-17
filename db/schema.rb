# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_10_17_131554) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.text "line_one"
    t.text "line_two"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "message_thread_messages", force: :cascade do |t|
    t.bigint "message_thread_id", null: false
    t.bigint "message_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_thread_messages_on_message_id"
    t.index ["message_thread_id"], name: "index_message_thread_messages_on_message_thread_id"
  end

  create_table "message_threads", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "message_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_threads_on_message_id"
    t.index ["post_id"], name: "index_message_threads_on_post_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_messages_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.bigint "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "message_thread_messages", "message_threads"
  add_foreign_key "message_thread_messages", "messages"
  add_foreign_key "message_threads", "messages"
  add_foreign_key "message_threads", "posts"
  add_foreign_key "messages", "posts"
  add_foreign_key "posts", "users"
  add_foreign_key "users", "addresses"
end

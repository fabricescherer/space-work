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

ActiveRecord::Schema.define(version: 2019_05_29_133127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "capacity_per_days", force: :cascade do |t|
    t.string "date"
    t.integer "seats_available"
    t.bigint "space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_capacity_per_days_on_space_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "period"
    t.float "total_price"
    t.bigint "user_id"
    t.bigint "space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_worker"
    t.string "reservation_range"
    t.index ["space_id"], name: "index_reservations_on_space_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "stars"
    t.text "content"
    t.bigint "user_id"
    t.bigint "space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_reviews_on_space_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.string "title"
    t.string "localisation"
    t.string "availabilities"
    t.float "price"
    t.string "space_type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.boolean "online"
    t.integer "capacity"
    t.index ["user_id"], name: "index_spaces_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "surname"
    t.string "company_name"
    t.text "user_description"
    t.boolean "space_owner", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "capacity_per_days", "spaces"
  add_foreign_key "reservations", "spaces"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "spaces"
  add_foreign_key "reviews", "users"
  add_foreign_key "spaces", "users"
end

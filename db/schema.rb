# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_23_120755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "manufacturing_entries", force: :cascade do |t|
    t.string "user_name"
    t.string "shift"
    t.integer "production_count"
    t.integer "defect_count"
    t.datetime "start_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "mobile_number"
    t.text "password_digest", null: false
    t.datetime "password_reset_requested"
    t.boolean "status", default: true
    t.datetime "last_login"
    t.text "last_login_ip", default: "0.0.0.0", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
  end

end

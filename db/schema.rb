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

ActiveRecord::Schema.define(version: 2019_04_19_230611) do

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "author"
    t.string "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.index ["category_id"], name: "index_activities_on_category_id"
  end

  create_table "billings", force: :cascade do |t|
    t.string "code"
    t.string "payment_method"
    t.decimal "amount", precision: 12, scale: 2
    t.string "currency"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_billings_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "past"
    t.string "sustantivo"
  end

  create_table "contacts", force: :cascade do |t|
    t.boolean "blocked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "followed_id"
    t.index ["followed_id"], name: "index_contacts_on_followed_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "promote_activities", force: :cascade do |t|
    t.integer "user_id"
    t.integer "activity_id"
    t.decimal "amount", precision: 12, scale: 2
    t.boolean "payed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "billing_id"
    t.index ["activity_id"], name: "index_promote_activities_on_activity_id"
    t.index ["billing_id"], name: "index_promote_activities_on_billing_id"
    t.index ["user_id"], name: "index_promote_activities_on_user_id"
  end

  create_table "user_activities", force: :cascade do |t|
    t.integer "user_id"
    t.integer "activity_id"
    t.datetime "start"
    t.datetime "end"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_user_activities_on_activity_id"
    t.index ["user_id"], name: "index_user_activities_on_user_id"
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
    t.date "birth"
    t.integer "role"
    t.string "country"
    t.string "city"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

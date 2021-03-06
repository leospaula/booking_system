# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160618125124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "bookings", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.uuid     "room_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bookings", ["room_id"], name: "index_bookings_on_room_id", using: :btree

  create_table "hotels", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.uuid     "owner_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "hotels", ["owner_id"], name: "index_hotels_on_owner_id", using: :btree

  create_table "owners", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "owners", ["email"], name: "index_owners_on_email", unique: true, using: :btree
  add_index "owners", ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true, using: :btree

  create_table "rooms", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "type_r"
    t.integer  "quantity"
    t.decimal  "price",      precision: 5, scale: 2, default: 0.0
    t.uuid     "hotel_id",                                         null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "rooms", ["hotel_id"], name: "index_rooms_on_hotel_id", using: :btree

end

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

ActiveRecord::Schema.define(version: 20160115205050) do

  create_table "bars", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "street",     limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.integer  "zip",        limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tabs", force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "bar_id",  limit: 4
    t.float   "balance", limit: 24, default: 0.0, null: false
  end

  add_index "tabs", ["bar_id"], name: "index_tabs_on_bar_id", using: :btree
  add_index "tabs", ["user_id"], name: "index_tabs_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "address",         limit: 255
    t.string   "city",            limit: 255
    t.string   "state",           limit: 255
    t.string   "zip",             limit: 255
    t.string   "password_digest", limit: 255
    t.string   "auth_token",      limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end

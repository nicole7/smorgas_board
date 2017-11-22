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

ActiveRecord::Schema.define(version: 20171122193207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendings", id: false, force: :cascade do |t|
    t.integer "requester_id"
    t.integer "acceptor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acceptor_id", "requester_id"], name: "index_friendings_on_acceptor_id_and_requester_id", unique: true
    t.index ["requester_id", "acceptor_id"], name: "index_friendings_on_requester_id_and_acceptor_id", unique: true
  end

  create_table "gamables", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "category"
    t.string "player_num"
    t.string "playing_time"
    t.string "year_created"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

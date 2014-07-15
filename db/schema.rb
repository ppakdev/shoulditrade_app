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

ActiveRecord::Schema.define(version: 20140714225342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "packages", force: true do |t|
    t.date    "posted"
    t.integer "trade_id"
  end

  create_table "packages_players", id: false, force: true do |t|
    t.integer "package_id"
    t.integer "player_id"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "position"
    t.string   "team"
    t.integer  "package_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", force: true do |t|
    t.boolean  "vote"
    t.integer  "trade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trades", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end

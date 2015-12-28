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

ActiveRecord::Schema.define(version: 20151228182136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.string   "title"
    t.integer  "number"
    t.integer  "season"
    t.integer  "trakt_id"
    t.string   "imdb_id"
    t.integer  "tmdb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "air_date"
    t.integer  "show_id"
    t.integer  "tvdb_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string   "title"
    t.string   "debut_year"
    t.integer  "trakt_id"
    t.string   "imdb_id"
    t.integer  "tmdb_id"
    t.integer  "tvrage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tvdb_id"
  end

end

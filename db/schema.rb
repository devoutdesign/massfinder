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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110705200245) do

  create_table "masses", :force => true do |t|
    t.string   "day"
    t.string   "start_time"
    t.string   "notes"
    t.integer  "parish_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parishes", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "mailing_address"
    t.string   "phone"
    t.string   "website"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.boolean  "gmaps"
  end

end

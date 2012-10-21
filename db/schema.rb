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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121021033633) do

  create_table "ebooks", :force => true do |t|
    t.string   "location"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "site_args", :force => true do |t|
    t.string   "url"
    t.integer  "max_entries"
    t.string   "next_post"
    t.string   "post_matcher"
    t.integer  "starting_page"
    t.integer  "starting_page_inc"
    t.string   "filename"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "ebook_id"
  end

end

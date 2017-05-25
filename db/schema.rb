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

ActiveRecord::Schema.define(version: 20170524154420) do

  create_table "employees", force: :cascade do |t|
    t.integer "employee_id"
    t.string "preferred_name"
    t.string "title"
    t.string "work_phone"
    t.string "personal_email"
    t.string "date_of_birth"
    t.string "department_url"
    t.string "employee_type"
    t.string "status"
    t.string "subordinates_url"
    t.string "photo_thumbnail_url"
    t.string "personal_phone"
    t.string "work_email"
    t.string "gender"
    t.string "manager"
    t.string "salary"
    t.string "location"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "search_suggestions", force: :cascade do |t|
    t.string "term"
    t.integer "popularity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

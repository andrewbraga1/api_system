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

ActiveRecord::Schema.define(version: 2021_12_04_214429) do

  create_table "exams", force: :cascade do |t|
    t.string "name"
    t.string "typo"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_exams_on_discarded_at"
  end

  create_table "laboratories", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_laboratories_on_discarded_at"
  end

  create_table "laboratory_exams", force: :cascade do |t|
    t.integer "laboratory_id"
    t.integer "exam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_laboratory_exams_on_exam_id"
    t.index ["laboratory_id"], name: "index_laboratory_exams_on_laboratory_id"
  end

end

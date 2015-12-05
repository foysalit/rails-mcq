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

ActiveRecord::Schema.define(version: 20151205213210) do

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id", limit: 4
    t.integer  "choice_id",   limit: 4
    t.boolean  "correct"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "answers", ["choice_id"], name: "index_answers_on_choice_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "choices", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.integer  "question_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "choices", ["question_id"], name: "index_choices_on_question_id", using: :btree

  create_table "exams", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.boolean  "expired"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "exams", ["title"], name: "index_exams_on_title", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "exam_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "questions", ["exam_id"], name: "index_questions_on_exam_id", using: :btree

  add_foreign_key "answers", "choices"
  add_foreign_key "answers", "questions"
  add_foreign_key "choices", "questions"
  add_foreign_key "questions", "exams"
end

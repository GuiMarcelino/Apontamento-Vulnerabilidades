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

ActiveRecord::Schema.define(version: 2022_03_31_233752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "historics", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "vulnerable_id", null: false
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.boolean "active", default: true
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_historics_on_active"
    t.index ["created_at"], name: "index_historics_on_created_at"
    t.index ["created_by_id"], name: "index_historics_on_created_by_id"
    t.index ["deleted_at"], name: "index_historics_on_deleted_at"
    t.index ["updated_at"], name: "index_historics_on_updated_at"
    t.index ["updated_by_id"], name: "index_historics_on_updated_by_id"
    t.index ["user_id"], name: "index_historics_on_user_id"
    t.index ["vulnerable_id"], name: "index_historics_on_vulnerable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "provider", null: false
    t.string "uid", default: "", null: false
    t.boolean "active", default: true, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vulnerables", force: :cascade do |t|
    t.string "nome"
    t.text "description"
    t.integer "level"
    t.integer "status"
    t.text "solution"
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.boolean "active", default: true
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_vulnerables_on_active"
    t.index ["created_at"], name: "index_vulnerables_on_created_at"
    t.index ["created_by_id"], name: "index_vulnerables_on_created_by_id"
    t.index ["deleted_at"], name: "index_vulnerables_on_deleted_at"
    t.index ["updated_at"], name: "index_vulnerables_on_updated_at"
    t.index ["updated_by_id"], name: "index_vulnerables_on_updated_by_id"
  end

  add_foreign_key "historics", "users"
  add_foreign_key "historics", "users", column: "created_by_id"
  add_foreign_key "historics", "users", column: "updated_by_id"
  add_foreign_key "historics", "vulnerables"
  add_foreign_key "vulnerables", "users", column: "created_by_id"
  add_foreign_key "vulnerables", "users", column: "updated_by_id"
end

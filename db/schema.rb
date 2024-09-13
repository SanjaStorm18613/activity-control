# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_09_13_203743) do
  create_table "atividades", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "tematica"
    t.integer "area", null: false
    t.text "objetivo"
    t.text "acoes_realizadas"
    t.integer "numero_participantes"
    t.bigint "responsavel_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["responsavel_id"], name: "index_atividades_on_responsavel_id"
    t.index ["user_id"], name: "index_atividades_on_user_id"
  end

  create_table "atividades_participantes", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.bigint "atividade_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atividade_id"], name: "index_atividades_participantes_on_atividade_id"
    t.index ["user_id"], name: "index_atividades_participantes_on_user_id"
  end

  create_table "users", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome_completo"
    t.string "username", null: false
    t.string "encrypted_password", null: false
    t.integer "role", default: 0
    t.integer "area", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "password_digest"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "atividades", "users"
  add_foreign_key "atividades", "users", column: "responsavel_id"
  add_foreign_key "atividades_participantes", "atividades"
  add_foreign_key "atividades_participantes", "users"
end

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

ActiveRecord::Schema[7.0].define(version: 2023_03_11_121919) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "certificate_templates", force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "modifications", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.bigint "certificate_template_id", null: false
    t.boolean "display_qr", default: false
    t.boolean "display_verify_link", default: false
    t.boolean "display_cert_id", default: false
    t.boolean "email", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certificate_template_id"], name: "index_groups_on_certificate_template_id"
  end

  add_foreign_key "groups", "certificate_templates"
end

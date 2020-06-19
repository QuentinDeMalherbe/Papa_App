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

ActiveRecord::Schema.define(version: 2020_05_06_121330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "customer_id"
    t.integer "insure_trade_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_contracts_on_customer_id"
    t.index ["user_id"], name: "index_contracts_on_user_id"
  end

  create_table "customer_contacts", force: :cascade do |t|
    t.string "last_name_contact"
    t.string "last_name_dirigeant"
    t.string "last_name_correspondance"
    t.string "position_contact"
    t.string "position_dirigeant"
    t.string "position_correspondance"
    t.string "email_dirigeant"
    t.string "email_contact"
    t.string "email_correspondance"
    t.string "tel_contact"
    t.string "tel_dirigeant"
    t.string "tel_correspondance"
    t.bigint "insure_trad_supp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insure_trad_supp_id"], name: "index_customer_contacts_on_insure_trad_supp_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "compagny_name"
    t.string "address"
    t.integer "zip_code"
    t.string "city"
    t.string "country"
    t.integer "activity_code"
    t.string "siret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers_infos", force: :cascade do |t|
    t.string "legalForm"
    t.text "saleInsured"
    t.string "compagny_name"
    t.string "address"
    t.integer "zip_code"
    t.string "city"
    t.string "country"
    t.integer "activity_code"
    t.string "siret"
    t.bigint "insure_trad_supp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insure_trad_supp_id"], name: "index_customers_infos_on_insure_trad_supp_id"
  end

  create_table "insure_trad_supps", force: :cascade do |t|
    t.integer "amountCA"
    t.float "percentCA"
    t.integer "numberTotalInsured"
    t.float "percentBadlyCovert"
    t.bigint "contract_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_insure_trad_supps_on_contract_id"
  end

  create_table "loss_payees", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "zipcode"
    t.string "city"
    t.string "country"
    t.bigint "primary_insurance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["primary_insurance_id"], name: "index_loss_payees_on_primary_insurance_id"
  end

  create_table "options", force: :cascade do |t|
    t.integer "cumul_loses_insured"
    t.integer "max_auto_indiv_insured_loss"
    t.integer "annual_prenium"
    t.integer "quatrieme_layer"
    t.integer "troisieme_layer"
    t.integer "deuxieme_layer"
    t.integer "premier_layer"
    t.integer "policy_admin"
    t.bigint "insure_trad_supp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insure_trad_supp_id"], name: "index_options_on_insure_trad_supp_id"
  end

  create_table "primary_insurances", force: :cascade do |t|
    t.string "name_insurer"
    t.integer "policy_number"
    t.date "policy_period_start"
    t.date "policy_period_end"
    t.string "intermediaire"
    t.integer "loss_payee"
    t.bigint "insure_trad_supp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insure_trad_supp_id"], name: "index_primary_insurances_on_insure_trad_supp_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contracts", "customers"
  add_foreign_key "contracts", "users"
  add_foreign_key "customer_contacts", "insure_trad_supps"
  add_foreign_key "customers_infos", "insure_trad_supps"
  add_foreign_key "insure_trad_supps", "contracts"
  add_foreign_key "loss_payees", "primary_insurances"
  add_foreign_key "options", "insure_trad_supps"
  add_foreign_key "primary_insurances", "insure_trad_supps"
end

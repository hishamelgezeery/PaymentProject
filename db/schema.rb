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

ActiveRecord::Schema.define(version: 20160825184806) do

  create_table "clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "subdomain"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id"], name: "index_clients_on_location_id", using: :btree
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "state"
    t.string   "county"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "transaction_date"
    t.integer  "last_four_digits"
    t.string   "card_type"
    t.decimal  "authorized_amount", precision: 8, scale: 2
    t.integer  "payment_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["payment_id"], name: "index_payment_details_on_payment_id", using: :btree
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "defendent_name"
    t.string   "citation_number"
    t.string   "email"
    t.string   "address"
    t.string   "phone_number"
    t.decimal  "amount",          precision: 8, scale: 2
    t.decimal  "convenience_fee", precision: 8, scale: 2
    t.decimal  "total_amount",    precision: 8, scale: 2
    t.boolean  "is_paid",                                 default: false
    t.date     "payment_date"
    t.integer  "client_id"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.index ["client_id"], name: "index_payments_on_client_id", using: :btree
  end

  add_foreign_key "clients", "locations"
  add_foreign_key "payment_details", "payments"
  add_foreign_key "payments", "clients"
end

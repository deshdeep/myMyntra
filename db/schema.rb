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

ActiveRecord::Schema.define(version: 20170507171741) do

  create_table "carts", force: :cascade do |t|
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "carts", ["customer_id"], name: "index_carts_on_customer_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "mobile_number"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true

  create_table "delivery_addresses", force: :cascade do |t|
    t.text     "address"
    t.string   "email"
    t.string   "mobile_number"
    t.integer  "customer_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "delivery_addresses", ["customer_id"], name: "index_delivery_addresses_on_customer_id"

  create_table "orders", force: :cascade do |t|
    t.float    "product_price"
    t.integer  "quantity"
    t.float    "total"
    t.integer  "customer_id"
    t.integer  "delivery_address_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"
  add_index "orders", ["delivery_address_id"], name: "index_orders_on_delivery_address_id"

  create_table "products", force: :cascade do |t|
    t.string   "brand"
    t.string   "name"
    t.float    "price"
    t.string   "size"
    t.string   "color"
    t.integer  "order_id"
    t.integer  "cart_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "products", ["cart_id"], name: "index_products_on_cart_id"
  add_index "products", ["category_id"], name: "index_products_on_category_id"
  add_index "products", ["order_id"], name: "index_products_on_order_id"

end

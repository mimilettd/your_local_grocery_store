# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_24_074508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "product_line_items", force: :cascade do |t|
    t.integer "quantity", null: false
    t.integer "price"
    t.bigint "product_id"
    t.bigint "receipt_id"
    t.index ["product_id"], name: "index_product_line_items_on_product_id"
    t.index ["receipt_id"], name: "index_product_line_items_on_receipt_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", default: 0, null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.integer "total_price"
    t.integer "total_savings"
  end

  create_table "sales", force: :cascade do |t|
    t.string "name", null: false
    t.integer "quantity"
    t.integer "sale_price"
    t.bigint "product_id"
    t.index ["product_id"], name: "index_sales_on_product_id"
  end

  add_foreign_key "product_line_items", "products"
  add_foreign_key "product_line_items", "receipts"
  add_foreign_key "sales", "products"
end

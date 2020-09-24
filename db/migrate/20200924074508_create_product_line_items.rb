class CreateProductLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :product_line_items do |t|
      t.integer :quantity, null: false
      t.integer :price
      t.references :product, foreign_key: true
      t.references :receipt, foreign_key: true
    end
  end
end

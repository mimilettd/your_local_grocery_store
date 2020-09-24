class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.string :name, null: false
      t.integer :quantity
      t.integer :sale_price
      t.references :product, foreign_key: true
    end
  end
end

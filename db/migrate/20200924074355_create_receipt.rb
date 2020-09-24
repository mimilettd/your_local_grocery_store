class CreateReceipt < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.integer :total_price
      t.integer :total_savings
    end
  end
end

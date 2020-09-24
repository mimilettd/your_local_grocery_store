namespace :db do
  task backfill_products: :environment do
    PRODUCTS = [
      { name: "Milk", unit_price: 397 },
      { name: "Bread", unit_price: 217 },
      { name: "Banana", unit_price: 99 },
      { name: "Apple", unit_price: 89 }
    ]

    PRODUCTS.each do |product|
      Product.create!(
        name: product[:name],
        price: product[:unit_price]
      )
    end

    puts "Created #{Product.count} products."
  end
end

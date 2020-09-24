namespace :db do
  task backfill_sales: :environment do
    milk = Product.find_by(name: "Milk")
    sale1 = Sale.create(
      name: "2 for $5.00",
      quantity: 2,
      sale_price: 500,
      product: milk
    )

    puts "Created #{sale1.name} sale!"

    bread = Product.find_by(name: "Bread")
    sale2 = Sale.create(
      name: "3 for $6.00",
      quantity: 3,
      sale_price: 600,
      product: bread
    )

    puts "Created #{sale2.name} sale!"
  end
end

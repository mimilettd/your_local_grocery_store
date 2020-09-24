class ReceiptWriter
  def self.call(items)
    new(items).call
  end

  def initialize(items)
    @items = items
  end

  def call
    persist_product_line_items
    persist_total_price
    persist_total_savings
    receipt
  end

  def receipt
    @receipt ||= Receipt.new
  end

  def persist_product_line_items
    items_and_quantity.each do |item, quantity|
      product = Product.find_by(name: item.capitalize)
      sale = Sale.find_by(product: product)
      price = PriceCalculator.call(product: product, quantity: quantity, sale: sale)
      receipt.product_line_items.new(product: product, quantity: quantity, price: price)
    end
    receipt.save!
  end

  def persist_total_price
    price = receipt.product_line_items.sum(:price)
    receipt.update(total_price: price)
  end

  def persist_total_savings
    savings = price_without_savings - receipt.total_price
    receipt.update(total_savings: savings)
  end

  def price_without_savings
    receipt.product_line_items.sum(&:price_without_savings)
  end

  def sanitized_items_array
    items.split(",").map { |item| item.strip }
  end

  def items_and_quantity
    sanitized_items_array
      .each_with_object(Hash.new(0)) do |name, hash|
        hash[name] += 1
    end
  end

  private

  attr_reader :items
end

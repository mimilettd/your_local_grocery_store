class SaleCalculator
  def self.call(product:, quantity:, sale:)
    new(product, quantity, sale).call
  end

  def initialize(product, quantity, sale)
    @product= product
    @quantity = quantity
    @sale = sale
  end

  def call
    (sale_units * sale.sale_price) +
      (non_sale_units * product.price)
  end

  def sale_units
    @sale_units ||= quantity / sale.quantity
  end

  def non_sale_units
    quantity - (sale_units * sale.quantity)
  end

  private

  attr_reader :product, :quantity, :sale
end

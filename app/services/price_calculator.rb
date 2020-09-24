class PriceCalculator
  def self.call(product:, quantity:, sale:)
    new(product, quantity, sale).call
  end

  def initialize(product, quantity, sale)
    @product = product
    @quantity = quantity
    @sale = sale
  end

  def call
    if sale
      SaleCalculator.call(
        product: product,
        quantity: quantity,
        sale: sale
      )
    else
      quantity * product.price
    end
  end

  private

  attr_reader :product, :quantity, :sale
end

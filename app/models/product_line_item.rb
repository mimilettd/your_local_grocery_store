class ProductLineItem < ApplicationRecord
  belongs_to :receipt
  belongs_to :product

  def price_without_savings
    quantity * product.price
  end
end

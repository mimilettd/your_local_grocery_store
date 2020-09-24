class Product < ApplicationRecord
  def on_sale?
    Sale.find_by(product: self).present?
  end
end

class Receipt < ApplicationRecord
  has_many :product_line_items
end

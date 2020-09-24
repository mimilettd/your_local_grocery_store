require 'rails_helper'

describe ReceiptWriter do
  context '.call' do
    let!(:milk_product) do
      Product.create(name: "Milk", price: 397)
    end
    let!(:bread_product) do
      Product.create(name: "Bread", price: 217)
    end
    let!(:banana_product) do
      Product.create(name: "Banana", price: 99)
    end
    let!(:apple_product) do
      Product.create(name: "Apple", price: 89)
    end
    let!(:sale1) do
      Sale.create(
      name: "2 for $5.00",
      quantity: 2,
      sale_price: 500,
      product: milk_product
    )
    end
    let!(:sale2) do
      Sale.create(
      name: "3 for $6.00",
      quantity: 3,
      sale_price: 600,
      product: bread_product
    )
    end

    subject { described_class.call(items) }

    context 'given an array of items' do
      let(:items) do
        "milk,milk, bread,banana,bread,bread,bread,milk,apple"
      end

      it 'creates a receipt' do
        subject

        receipt = Receipt.last

        expect(receipt.total_price).to eq(1902)
        expect(receipt.total_savings).to eq(345)
        expect(receipt.product_line_items.count).to eq(4)
      end
    end
  end
end

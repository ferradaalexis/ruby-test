require 'rails_helper'

RSpec.describe Product, type: :model do
  products = [{ name: 'Medium Coverage', sell_in: 10, price: 20},
              { name: 'Full Coverage', sell_in: 2, price: 0},
              { name: 'Low Coverage', sell_in: 5, price: 7},
              { name: 'Mega Coverage', sell_in: 0, price: 80},
              { name: 'Mega Coverage', sell_in: -1,price: 80},
              { name: 'Special Full Coverage', sell_in: 15, price: 20},
              { name: 'Special Full Coverage', sell_in: 10, price: 49},
              { name: 'Special Full Coverage', sell_in: 5, price: 49},
              { name: 'Super Sale', sell_in: 3, price: 6}]



  products.each do | p |
    it "Update Prices to #{p[:name]} after 1 day" do
      product = build(:product, name: p[:name], sell_in: p[:sell_in], price: p[:price])
      expect(product.update_price).to eq(build(:product, name: p[:name], sell_in_after_30days: p[:sell_in_after_30days], price_after_30days: p[:price_after_30days]))
    end
  end
end

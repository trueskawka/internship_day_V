require_relative './lib/model/product'
require_relative './lib/model/warehouse'
require_relative './lib/services/fetch_product'
require_relative './lib/services/fetch_products'
require_relative './lib/services/create_warehouse'
require_relative './lib/services/delete_warehouse'

module Shop
  PRODUCTS = [
    Product.new('foo', 12),
    Product.new('bar', 21),
  ]

  WAREHOUSE = []

  class Main
    def self.run
      PRODUCTS.each do |product|
        CreateWarehouse.new.call(product.id, rand(10)+1)
      end
    end
  end
end

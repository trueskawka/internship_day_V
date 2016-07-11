require "bundler/setup"
require "sinatra/base"

Dir["./lib/**/*.rb"].each{|file| require file}

module Shop
  PRODUCTS = [
    Product.new('foo', 12),
    Product.new('bar', 21),
    Product.new('baz', 22),
  ]

  WAREHOUSE = []
  BASKET = []

  class App < Sinatra::Base
    get "/" do
      products = FetchProducts.new.call
      erb :"products/index", locals: { products: products, title: "Products" }
    end

    get "/products/:id" do |id|
      product = FetchProduct.new.call(id)
      erb :"products/show", locals: { product: product }
    end

    get "/basket" do
      products_in_basket = FetchBasket.new.call
      erb :"basket/show", locals: { basket: products_in_basket }
    end

    post "/basket" do
      AddToBasket.new(params).call
      redirect "/"
    end
  end
end

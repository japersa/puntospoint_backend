module Api
  module V1
    class ProductsController < ApplicationController
      before_action :authorize_request

      def most_purchased
        products = Product.joins(:purchases)
                          .group('products.id')
                          .select('products.*, COUNT(purchases.id) as purchase_count')
                          .order('purchase_count DESC')
        render json: products
      end

      def top_revenue
        products = Product.joins(:purchases)
                          .group('products.id')
                          .select('products.*, SUM(products.price) as total_revenue')
                          .order('total_revenue DESC')
                          .limit(3)
        render json: products
      end
    end
  end
end

module Api
  module V1
    class PurchasesController < ApplicationController
      before_action :authorize_request

      def filter
        purchases = Purchase.all
        purchases = purchases.where(created_at: params[:from_date]..params[:to_date]) if params[:from_date] && params[:to_date]
        purchases = purchases.joins(product: :categories).where(categories: { id: params[:category_id] }) if params[:category_id]
        purchases = purchases.where(client_id: params[:client_id]) if params[:client_id]
        purchases = purchases.joins(product: :created_by).where(products: { created_by_id: params[:admin_user_id] }) if params[:admin_user_id]
        render json: purchases
      end

      def granularity
        range = params[:from_date]..params[:to_date]
        purchases = Purchase.where(created_at: range)
        group_by = case params[:granularity]
                   when 'hour' then "DATE_TRUNC('hour', created_at)"
                   when 'day' then "DATE_TRUNC('day', created_at)"
                   when 'week' then "DATE_TRUNC('week', created_at)"
                   when 'year' then "DATE_TRUNC('year', created_at)"
                   else "DATE_TRUNC('day', created_at)"
                   end
        data = purchases.group(group_by).count
        render json: data
      end

      def create
        purchase = Purchase.new(purchase_params)
        if purchase.save
          render json: purchase, status: :created
        else
          render json: { errors: purchase.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def purchase_params
        params.require(:purchase).permit(:client_id, :product_id)
      end
    end
  end
end

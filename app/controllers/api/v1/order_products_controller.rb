class Api::V1::OrderProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @order_products = []
    Order.all.each do |order|
      @order_products << order.order_products
    end
    render json: @order_products
  end

  def create
    @order_product = OrderProduct.new(order_product_params)
    if @order_product.save
      render json: @order_product, status: :created
    else
      render json: @order_product.errors, status: :unprocessable_entity
    end
  end

  private

  def order_product_params
    params.require(:order_product).permit(:price, :quantity, :grind, :order_id, :product_id)
  end
end

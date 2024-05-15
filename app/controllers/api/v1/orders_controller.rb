class Api::V1::OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @orders = Order.joins(:order_products).select("order_products.*, orders.id AS order_id ,orders.billing_amount, orders.shipping_name")
    render json: @orders
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end
  private
  def order_params
    params.require(:order).permit(:shipping_name, :postal_code, :address1, :address2, :address3, :shipping_tel, :postage, :billing_amount, :status, :user_id)
  end
end

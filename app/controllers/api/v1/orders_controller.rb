class Api::V1::OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @orders = Order.joins(:order_products).select("order_products.*, orders.id AS order_id ,orders.billing_amount, orders.shipping_name")
    render json: @orders
  end

  def confirm
    @order = Order.new
    # CartItem.where(user_id: current_user.id).each do |item|
    CartItem.each do |item|
      @order.order_products.new(product_id: item.product_id)
    end
    render json: @order
  end

  def create
    @order = Order.new(order_params)
    order_params[:order_products].each do |order_product|
      order_product = Product.find(order_product[:product_id])
      @order.order_products.new(price: order_product[:price], quantity: order_product[:quantity], grind: order_product[:grind], order_id: order_product[:order_id], product_id: order_product[:product_id])
    end
    if @order.save
      CartItem.destroy_all
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

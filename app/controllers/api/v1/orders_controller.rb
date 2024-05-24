class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_api_v1_user!, except: [:new, :create, :confirm]

  def index
    @orders = []
    Order.where(user_id: current_api_v1_user.id).order(id: "DESC").each do |order|
      @order_products = Hash.new
      @order_products['order_products'] = order.order_products
      @order_products['created_at'] = order.created_at
      @order_products['billing_amount'] = order.billing_amount
      @orders << @order_products
    end
    render json: @orders
  end

  def confirm
    @order = Order.new
    CartItem.where(user_id: current_api_v1_user.id).each do |item|
      @order.order_products.new(product_id: item.product_id)
    end
    render json: @order
  end

  def create
    @order = Order.new(order_params)

    params[:order][:order_products].each do |order_product|
      product = Product.find(order_product[:product_id])
        @order.order_products.new(
        price: order_product[:price],
        quantity: order_product[:quantity],
        grind: order_product[:grind],
        name: order_product[:name],
        product_id: product.id
        )
    end
    if @order.save!
      CartItem.destroy_all
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def determine
    order_id = OrderProduct.maximum(:order_id)
    @order_products = OrderProduct.where(order_id: order_id)
    render json: @order_products
  end

  private

  def order_params
    params.require(:order).permit(
      :shipping_name,
      :postal_code,
      :address1,
      :address2,
      :address3,
      :shipping_tel,
      :postage,
      :billing_amount,
      :status,
      :user_id,
      # order_products:[]
      )
  end
end

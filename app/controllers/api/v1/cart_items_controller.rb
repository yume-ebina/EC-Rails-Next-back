class Api::V1::CartItemsController < ApplicationController
  before_action :authenticate_api_v1_user!, except: [:new, :create]
  def index
    # @cart_items = current_user.cart_items
    # @cart_items = Product.joins(:cart_items).select("cart_items.*,products.id, products.name, products.price")
    # @cart_items = CartItem.where(user_id: current_api_v1_user.id)
    # @cart_items = Product.includes(:cart_items).where(cart_items: {user_id: current_api_v1_user.id})
    @cart_items = CartItem.joins(:product)
                          .select('products.name', 'products.price', 'products.id', 'cart_items.grind','cart_items.quantity', 'cart_items.product_id')

    render json: @cart_items
  end

  def create
    # increase_or_create(params[:cart_item][:product_id])
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      render json: @cart_item, status: :created
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # def increase
  #   @cart_item.increment!(:quantity, 1)
  #   redirect_to request.referer, notice: 'Successfully updated your cart'
  # end

  # def decrease
  #   decrease_or_destroy(@cart_item)
  #   redirect_to request.referer, notice: 'Successfully updated your cart'
  # end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
  end

  def destroy_all
    @cart_items = CartItem.where(user_id: current_api_v1_user.id)
    @cart_items.destroy_all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :user_id, :product_id, :grind, :name)
  end

  # def set_cart_item
  #   @cart_item = current_user.cart_items.find(params[:id])
  # end

  # def increase_or_create(product_id)
  #   cart_item = current_user.cart_items.find_by(product_id:)
  #   if cart_item
  #     cart_item.increment!(:quantity, 1)
  #   else
  #     current_user.cart_items.build(product_id:).save
  #   end
  # end

  # def decrease_or_destroy(cart_item)
  #   if cart_item.quantity > 1
  #     cart_item.decrement!(:quantity, 1)
  #   else
  #     cart_item.destroy
  #   end
  # end
end

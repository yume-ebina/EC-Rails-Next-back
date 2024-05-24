# class Api::V1::Checkout::SessionsController < ApplicationController
#   skip_before_action :verify_authenticity_token

#   def create

#     @order_product = OrderProduct.create!(order_product_params)
#     if @order_product.save
#       render json: @order_product, status: :created
#     else
#       render json: @order_product.errors, status: :unprocessable_entity
#     end
#   end

#   private

#   def order_product_params
#     params.require(:order_product).permit(:price, :quantity, :grind, :order_id, :product_id)
#   end
# end

    #   @order = Order.new(order_params)
  #   if @order.save
  #     render json: @order, status: :created
  #   else
  #     render json: @order.errors, status: :unprocessable_entity
  #   end

  # def order_params
  #   params.require(:order).permit(:shipping_name, :postal_code, :address1, :address2, :address3, :shipping_tel, :postage, :billing_amount, :status, :user_id)
  # end

  # def create
  #   line_items = User.find(1).line_items_checkout
  #   session = create_session(line_items)
  #   # Allow redirection to the host that is different to the current host
  #   redirect_to session.url, allow_other_host: true
  # end

  # private

  # def create_session(line_items)
  #   Stripe::Checkout::Session.create(
  #     client_reference_id: User.find(1).id,
  #     customer_email: User.find(1).email,
  #     mode: 'payment',
  #     payment_method_types: ['card'],
  #     line_items:,
  #     shipping_address_collection: {
  #       allowed_countries: ['JP']
  #     },
  #     shipping_options: [
  #       {
  #         shipping_rate_data: {
  #           type: 'fixed_amount',
  #           fixed_amount: {
  #             amount: 500,
  #             currency: 'jpy'
  #           },
  #           display_name: 'Single rate'
  #         }
  #       }
  #     ],
  #     success_url: "http://localhost:8000",
  #     cancel_url: "http://localhost:8000/users/cart_items"
  #   )
  # end
  # def create
  #   line_items = User.find(1).line_items_checkout
  #   session = create_session(line_items)
  #   render json: { session: session }, status: :ok
  # end

  # private

  # def create_session(line_items)
  #   Stripe::Checkout::Session.create(
  #     client_reference_id: User.find(1).id,
  #     customer_email: User.find(1).email,
  #     mode: 'payment',
  #     payment_method_types: ['card'],
  #     line_items: line_items,
  #     shipping_address_collection: {
  #       allowed_countries: ['JP']
  #     },
  #     shipping_options: [
  #       {
  #         shipping_rate_data: {
  #           type: 'fixed_amount',
  #           fixed_amount: {
  #             amount: 500,
  #             currency: 'jpy'
  #           },
  #           display_name: 'Single rate'
  #         }
  #       }
  #     ],
  #     success_url: 'http://localhost:8000',
  #     cancel_url: "http://localhost:8000/users/cart_items"
  #   )
  # end
# end

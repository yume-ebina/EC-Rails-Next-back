class User < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :profile

  validates :uid, uniqueness: { scope: :provider }

  # def line_items_checkout
  #   cart_items.map do |cart_item|
  #     {
  #       quantity: cart_item.quantity,
  #       price_data: {
  #         currency: 'jpy',
  #         unit_amount: cart_item.product.price,
  #         product_data: {
  #           name: cart_item.product.name,
  #           metadata: {
  #             product_id: cart_item.product_id
  #           }
  #         }
  #       }
  #     }
  def line_items_checkout
    cart.cart_items.not_order_confirm.map do |cart_item|
      {
        quantity: cart_item.quantity,
        price_data: {
          currency: 'jpy',
          unit_amount: cart_item.item.price,
          product_data: {
            name: cart_item.item.name,
            metadata: {
              product_id: cart_item.item_id
            }
          }
        }
      }
    end
  end
end

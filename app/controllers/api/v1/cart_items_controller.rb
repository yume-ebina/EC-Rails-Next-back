class Api::V1::CartItemsController < ApplicationController
  # before_action :authenticate_user!
  def index
    @cart_items = Product.where(name: "クッキー")
    res = []
    @cart_items.each do |product|
      if product.images.present?
        image = rails_blob_url(product.images.first, disposition: "attachment", expires_in: 60.minutes)
      end
      res << product.attributes.merge(image: image)
    end
    render json: res
  end
end

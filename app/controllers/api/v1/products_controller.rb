class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products
    # res = []
    # @products.each do |product|
    #   if product.images.present?
    #     image = rails_blob_url(product.images.first, disposition: "attachment", expires_in: 60.minutes)
    #   end
    #   res << product.attributes.merge(image: image)
    # end
    # render json: res
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
    # images = []
    # @product.images.each do | image |
    #   images << rails_blob_url(image, disposition: "attachment", expires_in: 60.minutes)
    # end
    # res = @product.attributes.merge(images: images)
    # render json: res
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :status)
  end
end
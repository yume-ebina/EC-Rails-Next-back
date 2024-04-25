class Product < ApplicationRecord
  has_many_attached :images
  # validate :image_content_type
  # validate :image_size

  # def image_content_type
  #   if images.attached? && !images.content_type.in?(%w[image/jpeg image/png image/gif])
  #     errors.add(:images, 'ファイル形式が、JPEG, PNG, GIF以外になってます。ファイル形式をご確認ください。')
  #   end
  # end

  # def image_size
  #   if images.attached? && images.blob.byte_size > 1.megabytes
  #     errors.add(:images, '1MB以下のファイルをアップロードしてください。')
  #   end
  # end
end

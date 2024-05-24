class User < ActiveRecord::Base

  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable
        #  omniauth_providers: %i[line]
  include DeviseTokenAuth::Concerns::User
  has_many :cart_items
  has_many :orders
end

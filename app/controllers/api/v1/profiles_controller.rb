# class Api::V1::ProfilesController < ApplicationController
  # before_action :set_current_user
  # skip_before_action :verify_authenticity_token
#   def update
#     profile = @current_user.profile || @current_user.build_profile

#     # address = Address.find_by(address: profile_params[:prefecture])
#     # if address
#     #   profile.address_id = address.id
#     # else
#     #   render json: { status: 'failure', message: 'Address not found', data: {} }, status: :not_found
#     #   return
#     # end

#     if profile.update(profile_params)
#       render json: profile, status: :ok
#     else
#       render json: { status: 'failure', message: profile.errors.full_messages.to_sentence, data: {} },
#              status: :unprocessable_entity
#     end
#   end

#   def show
#     profile = Profile.find_or_create_by(user_id: current_user.id) do |new_profile|
#       new_profile.name = current_user.name
#       new_profile.image = current_user.image
#     end
#     render json: profile
#   end

#   private

#   def profile_params
#     params.require(:profile).permit(:name, :email, :postal_code, :address1, :address2, :address3, :tel, :image)
#   end
# end

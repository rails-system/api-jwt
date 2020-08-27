class Api::V1::UsersController < ApplicationController
  before_action :authenticate_request!, only: [:file_upload]

  def file_upload
    if current_user.update_attributes(user_params)  
      render json: { success: true, pictures: current_user.pictures, message: 'update profile successfully' }, status: 200
    else
      render json: { success: false, message: current_user.errors }, status: 200
    end 
  end  

  private
  # If you have extra params to permit, append them to the sanitizer.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :phone_number, :is_verified, :verify_otp, :pictures_attributes => [:id, :image])
    end
end
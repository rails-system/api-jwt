class Api::V1::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    login = params[:user][:email].downcase || params[:user][:phone_nunber]
    user = User.where(["phone_number = :value OR email = :value", {value: login}]).first  
    if user.present? && user.valid_password?(params[:user][:password])
      token = JsonWebToken.encode(user_id: user.id)
      profile = user.profile
      render json: {
        success: true,
        auth_token: token,
        profile: profile
      }, status: :created and return
    else
      render json: {
        success: false,
        error: 'Invalid Credentials'
      }, status: :unauthorized and return
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

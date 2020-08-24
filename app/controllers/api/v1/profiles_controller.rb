class Api::V1::ProfilesController < ApplicationController
  before_action :authenticate_request!, only: [:update, :show]

  def show 
    @profile = current_user.profile
    render json: { success: true, profile: @profile ,message: 'update profile successfully' }, status: 200
  end  
  
  def update
    if current_user.profile.update(profile_params)
      render json: { success: true, message: 'update profile successfully' }, status: 200
    else
      render json: { success: false, message: current_user.profile.errors }, status: 200
    end  
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :dob, :marital_status, :gender, :with_whom, :dating_reason, :dating_type, :quesion_1, :quesion_2, :quesion_3, :quesion_4, :quesion_5, :user_id)
  end  
end
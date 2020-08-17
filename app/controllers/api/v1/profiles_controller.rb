class Api::V1::ProfilesController < ApplicationController
  before_action :authenticate!, only: :create

  def create
    profile = Profile.new(profile_params)
    if profile.save
      render json: { success: true, user: profile, message: 'added profile successfully' }, status: 200
    else
      render json: { success: false, message: 'please enter valid name' }, status: 200
    end  
  end  

  private
    def profile_params
      params.require(:profile).permit(:name)
    end  

end
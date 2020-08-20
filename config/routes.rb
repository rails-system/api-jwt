Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: {format: :json} do
    namespace :v1 do 
      devise_scope :user do
        post 'signup' => 'registrations#create'                                   
        post 'signin' => 'sessions#create'                                          
        delete 'signout' => 'sessions#destroy'    
      end
      resource :profile, only: [:show, :update]  
      resources :authentication do
        collection do
          post 'validate_otp'
        end  
      end
    end
  end   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

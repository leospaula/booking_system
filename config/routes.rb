Rails.application.routes.draw do
  
  devise_for :owners
  
  root 'home#index'
  
  resources :bookings, except: [:show]

  namespace :admin do
      root 'hotels#index'
      resources :hotels do
        resources :rooms
      end
  end
end

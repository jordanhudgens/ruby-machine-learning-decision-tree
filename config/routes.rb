Rails.application.routes.draw do
  resources :vehicles

  # Set root
  root 'vehicles#index'

  resources :vehicles do
    collection { post :import }
  end

end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :paintings do
    resources :bookings, only: [:index, :new, :create]
  end
  resources :bookings, except: [:index, :new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

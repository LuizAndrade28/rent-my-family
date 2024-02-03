Rails.application.routes.draw do
  devise_for :users
  root to: "family_members#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :family_members do
    resources :orders, only: %i[new create]
    resources :reviews, only: %i[new create]
  end
  resources :orders, only: %i[show index destroy]
  resources :users, only: %i[show]
end

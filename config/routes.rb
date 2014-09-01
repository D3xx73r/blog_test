Rails.application.routes.draw do
  root to: "application#index"

  devise_for :users

  namespace :admins do
    devise_for :admins
    resources :users
  end
end

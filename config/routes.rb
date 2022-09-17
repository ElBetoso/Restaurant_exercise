Rails.application.routes.draw do
  root "static_pages#home"
  get "cart", to: "cart#show"
  post "cart/add"
  post "cart/remove"

  resources :dishes
  resources :dish_groups, except: :show
  resources :restaurants

  namespace :authentication, path: "", as: "" do
   resources :users, only: [:new, :create]
   resources :sessions, only: [:new, :create]
 end
end

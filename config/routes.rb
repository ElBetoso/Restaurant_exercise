Rails.application.routes.draw do
  resources :order_items
  get "cart", to: "cart#show"
post "cart/add"
post "cart/remove"
root "static_pages#home"
  resources :dishes
  resources :dish_groups, except: :show
  resources :restaurants

  namespace :authentication, path: "", as: "" do
   resources :users, only: [:new, :create]
   resources :sessions, only: [:new, :create]
 end
end

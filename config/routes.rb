Rails.application.routes.draw do
  devise_for :users
  resources :historics
  resources :vulnerables
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

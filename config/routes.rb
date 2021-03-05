Rails.application.routes.draw do
  
  root to: 'toppages#index' 

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update]
  resources :posts, only: [:index, :new, :show, :update, :edit, :create]
  
end

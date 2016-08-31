Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts, only: [:index, :show]
  resources :categories, only: [:show]
  namespace :admins do
    resources :posts
    resources :categories
  end

  root 'pages#index'
end

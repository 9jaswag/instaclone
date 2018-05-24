Rails.application.routes.draw do
  resources :posts
  # post '/post/:user_id' => 'posts#create', as: 'create_post'

  devise_for :users
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

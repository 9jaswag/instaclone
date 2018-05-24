Rails.application.routes.draw do
  resources :posts
  post '/likes/:post_id', to: 'posts#add_like', as: "add_likes"

  devise_for :users
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

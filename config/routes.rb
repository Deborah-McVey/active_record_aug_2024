Rails.application.routes.draw do
  resources :posts
 
  get 'home/about'

  root 'posts#index'
end

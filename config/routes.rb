Rails.application.routes.draw do
  root to: "posts#index"
  resources :posts, only: [:index, :show, :destroy]
  get "posts/index" => "posts#index"
  get "new" => "posts#new"
  get "posts/:id" => "posts#show"
  get "about" => "pages#about"
  get "contact" => "pages#contact"
  post "posts/create" => "posts#create"
  devise_for :users
end

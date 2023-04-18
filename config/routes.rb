Rails.application.routes.draw do
  root to: "pages#index"
  resources :posts, only: [:index, :show]
  get "posts/:id" => "posts#show"
  get "about" => "pages#about"
  get "contact" => "pages#contact"
  devise_for :users
end

Rails.application.routes.draw do
  root to: "pages#index"
  resources :posts, only: [:index, :show]
  get "posts/:id" => "posts#show"
  devise_for :users
end

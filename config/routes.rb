Rails.application.routes.draw do
  get 'posts/index'
  root to: "pages#index"
  devise_for :users
end

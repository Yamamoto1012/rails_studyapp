Rails.application.routes.draw do
  root to: "pages#index"
  get 'posts/index'
  devise_for :users
end

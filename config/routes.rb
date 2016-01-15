Rails.application.routes.draw do

  namespace :v1 do
    resources :users, only: [:index, :show, :create]
    resources :bars, only: [:show]
  end
end
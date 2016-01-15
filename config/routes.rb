Rails.application.routes.draw do

  namespace :v1 do
    resources :users, only: [:index, :show, :create] do
      resources :tabs, only: [:index, :show]
    end

    resources :bars, only: [:index, :show] do
      resources :tabs, only: [:index, :show]
    end
  end
end
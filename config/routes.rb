Rails.application.routes.draw do
  resources :teams, only: [:index]
  root to: 'teams#index'
end

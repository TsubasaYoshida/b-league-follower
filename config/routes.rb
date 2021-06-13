Rails.application.routes.draw do
  resources :teams, only: [:index, :show]
  root to: 'teams#index'
end

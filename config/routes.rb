Rails.application.routes.draw do
  root 'search#welcome'
  resources :search, only: :index
end

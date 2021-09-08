Rails.application.routes.draw do
  devise_for :users
  root to: 'managements#index'
  resources :members do
    resources :meetings
  end
end

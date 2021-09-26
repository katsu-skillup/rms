Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'managements#index'
  resources :members do
    resources :meetings
  end
  resources :analyses
end

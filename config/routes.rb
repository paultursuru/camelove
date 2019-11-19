Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :animals do
    member do
      post :search
    end
    resources :bookings
  end

  get'animals/:id/dead', to: 'animals#dead', as: :dead_animal
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

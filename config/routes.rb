Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :visitors, only: :create do
    resources :entries, only: [:new, :create, :index]
  end

  resources :entries, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

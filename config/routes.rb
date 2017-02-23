Rails.application.routes.draw do

  scope :admin do
    resources :sessions, only: [:new, :create, :destroy]
    resources :entries, only: :index
  end


  resources :visitors, only: :create do
    resources :entries, only: :show
  end

  resources :entries, only: [:index, :show, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

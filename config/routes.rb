Rails.application.routes.draw do

  # scope :admin do
  #   resources :sessions, only: [:new, :create, :destroy]
  #   root 'sessions#new'
  # end

  resources :users, only: [:show, :edit, :update]

  # resources :visitors, only: :create do
  #   resources :entries, only: :create
  # end
  resources :entries, only: [:index, :create]

  get '/about', to: redirect("users/1")
  get '/blog', to: redirect("/entries")
  get '/contact', to: "entries#new"
  get '/projects', to: redirect("/entries?filter=projects")
  get '/resume', to: "welcomes#resume"

  root 'welcomes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

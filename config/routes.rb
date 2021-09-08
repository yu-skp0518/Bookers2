Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'favorites/create'
  get 'favorites/destroy'
  get '/search' => 'searches#search'

  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :followeds, on: :member
    get :followers, on: :member
  end

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]

    resources :book_comments, only: [:create, :destroy]
  end

end

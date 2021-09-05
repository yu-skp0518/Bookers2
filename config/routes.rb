Rails.application.routes.draw do

  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users, only: [:show, :index, :edit, :update]

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
  
    resources :book_comments, only: [:create, :destroy]
  end

end

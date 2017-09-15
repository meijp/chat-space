Rails.application.routes.draw do
  post 'groups/new' => 'groups#create'
  post 'groups/:id/edit' => 'groups#update'

  devise_for :users
  root 'messages#index'
  resources :users, only: [:edit, :update]
  resources :groups,only: [:edit, :new] do
    resources :messages, only: [:create, :index]
  end
end

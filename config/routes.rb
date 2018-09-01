Rails.application.routes.draw do
  devise_for :users
  root to: 'topics#index'
  resources :topics, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
  resources :comments, only: [:new, :create]
  end

  resources :users, only: [:show]

  # 時間があればユーザーに紐付いたコメントページも作りたかった

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

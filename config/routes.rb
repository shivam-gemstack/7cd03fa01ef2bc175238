Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'home#index'

  resources :questions do
  	resources :answers, only: [:create]
  	member do
  		post 'follow_topic', to: 'follower#follow_topic', as: :follow_topic
  		post 'follow_user', to: 'follower#follow_user', as: :follow_user

  	end
  end

  resources :topics

end

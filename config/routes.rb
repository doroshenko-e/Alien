Rails.application.routes.draw do

	root to: 'pages#home'

  get 'pages/home'
  get 'pages/about'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

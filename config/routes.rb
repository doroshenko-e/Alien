Rails.application.routes.draw do

	root to: 'pages#home'

  get 'pages/home'
  get 'pages/about'

  devise_for 	:users, 
  						:path => '', 
  						:path_names => {sign_in: 'login', sign_out: 'logout', edit: 'profile'},
  						:controllers => { omniauth_callbacks: 'omniauth_callbacks',
  															registrations: 'registrations'}

  resources :users, only: [:show]
  resources :rooms
  resources :images, only: [:show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :users
  get 'pages/home'
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

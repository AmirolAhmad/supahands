Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  #dashboard
  get "/dashboard" => 'dashboards#index'

  #user tasks
  resources :tasks
  
  #agent configuration
  namespace :agent, path: '/master' do
    get "/" => "dashboards#index", as: 'master'
    resources :tasks
  end
end

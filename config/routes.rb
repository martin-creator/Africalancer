Rails.application.routes.draw do
  root 'pages#home'
  get '/dashboard', to: 'users#dashboard'
  get '/users/:id', to: 'users#show'

  post '/users/edit', to: 'users#update'
  

  resources :gigs do
    member do
      delete :delete_photo
      post :upload_photo
    end
  end
 

  devise_for :users,
              path: '',
              path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'register'},
              controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

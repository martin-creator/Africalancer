Rails.application.routes.draw do
  get 'pages/home'

  devise_for :users,
              path: '',
              path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'register'},
              controllers: { omniauth_callbacks: 'omniauth_callbacks'}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

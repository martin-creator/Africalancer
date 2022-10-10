Rails.application.routes.draw do
  get 'message/create'
  root 'pages#home'
  get '/dashboard', to: 'users#dashboard'
  get '/users/:id', to: 'users#show', as: 'users'
  get '/selling_orders', to: 'orders#selling_orders'
  get '/buying_orders', to: 'orders#buying_orders'
  get '/orders/:id', to: 'orders#show', as: 'order_detail'
  get '/all_requests', to: 'requests#list'
  get '/request_offers/:id', to: 'requests#offers', as: 'request_offers'
  get '/my_offers', to: 'requests#my_offers'
  get '/search', to: 'pages#search'
  get '/calendar', to: 'pages#calendar'
  get '/plans', to: 'pages#plans'
  get 'settings/payment', to: 'users#payment', as: 'settings_payment'
  get 'settings/payout', to: 'users#payout', as: 'settings_payout'
  get '/gigs/:id/checkout/:pricing_type', to: 'gigs#checkout', as: 'checkout'
  get '/earnings', to: 'users#earnings', as: 'earnings'
  get '/conversations', to: 'conversations#list', as: "conversations"
  get '/conversations/:id', to: 'conversations#show', as: "conversation_detail"

  post '/users/edit', to: 'users#update'
  post '/offers',  to: 'offers#create'
  post '/reviews', to: 'reviews#create'
  post 'users/edit_phone', to: 'users#callback_phone'
  post '/settings/payment', to: 'users#update_payment', as: "update_payment"
  post '/settings/payout', to: 'users#update_payout', as: "update_payout"
  post '/users/withdraw', to: 'users#withdraw', as: 'withdraw'
  post 'messages', to: 'messages#create'
  post '/comments', to: 'comments#create'
  post '/subscribe', to: 'subscriptions#subscribe'
  post '/webhook', to: 'subscriptions#webhook'
  
  

  put '/orders/:id/complete', to: 'orders#complete', as: 'complete_order'
  put '/offers/:id/accept', to: 'offers#accept', as:  'accept_offer'
  put '/offers/:id/reject', to: 'offers#reject', as:  'reject_offer'

  delete '/users/remove_subscription', to: 'users#remove_subscription', as: 'remove_subscription'

  mount ActionCable.server => '/cable'

  resources :gigs do
    member do
      delete :delete_photo
      post :upload_photo
    end
    resources :orders, only: [:create]
  end

 resources :requests
 

  devise_for :users,
              path: '',
              path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'register'},
              controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

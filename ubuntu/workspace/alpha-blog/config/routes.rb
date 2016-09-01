Rails.application.routes.draw do
resources :clients do
  post :create_payment, :on => :collection
end
  resources :payments

  match '/', to: 'clients#index', constraints: { subdomain: 'www' }, via: [:get, :post, :put, :patch, :delete]
  match '/', to: 'clients#admin', constraints: { subdomain: 'admin' }, via: [:get]
  match '/', to: 'clients#show', constraints: { subdomain: /.+/ }, via: [:get, :post, :put, :patch, :delete]
  match '/success', to: 'clients#index', constraints: { subdomain: 'www' }, via: [:get, :post, :put, :patch, :delete]
  match '/success', to: 'clients#index', constraints: { subdomain: /.+/ }, via: [:get, :put, :patch, :delete]
  match '/success', to: 'clients#success', constraints: { subdomain: /.+/ }, via: [:post]

  root to: 'clients#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

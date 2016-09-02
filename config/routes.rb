Rails.application.routes.draw do
  resources :clients do
    post :create_payment, :on => :collection
  end
  match '/payments/search', to:'clients#admin', constraints: { subdomain: 'admin' }, via: [:get]
  match '/payments/search', to: 'clients#index', constraints: { subdomain: '/.+/' }, via: [:get]
  resources :payments do
    collection { post :search, to: 'clients#admin' }
  end

  match '/', to: 'clients#index', constraints: { subdomain: 'www' }, via: [:get, :post, :put, :patch, :delete]
  match '/', to: 'clients#admin', constraints: { subdomain: 'admin' }, via: [:get]
  match '/', to: 'clients#show', constraints: { subdomain: /.+/ }, via: [:get, :post, :put, :patch, :delete]
  match '/success', to: 'clients#index', constraints: { subdomain: 'www' }, via: [:get, :post, :put, :patch, :delete]
  match '/success', to: 'clients#success', constraints: { subdomain: /.+/ }, via: [:post]
  match '/success', to: 'clients#index', constraints: { subdomain: /.+/ }, via: [:get, :put, :patch, :delete]
  root to: 'clients#index', subdomain: 'www', constraints: {subdomain: '/.+/'}, via: [:get]

end
